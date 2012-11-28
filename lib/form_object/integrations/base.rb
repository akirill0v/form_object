module FormObject
  module Integrations
    module Base

      # DSL methods for integrations
      module ClassMethods
        # The default optons for integration
        attr_accessor :defaults

        # The name of integration
        def integration_name
          @integration_name ||= begin
            FormObject::Utils::StringConverter.integration_name(self.name).to_sym
          end
        end

        # Integration avaliable only if the ORM that integration is for
        # currently defined
        def avaliable?
          matching_ancestors.any? && Object.const_defined?(matching_ancestors[0].split('::')[0])
        end

        # The list of ancestor names that cause this integration to
        # matched.
        def matching_ancestors
          []
        end

        def matches?( klass )
          matches_ancestors?(klass.ancestors.map(&:name))
        end

        def matches_ancestors?( ancestors )
          (ancestors & matching_ancestors).any?
        end

        def versions
          @versions ||= []
        end

        # Define current version for integration
        # Can override some methods for different versions
        #
        # == Example:
        #
        #    module FormObject
        #      module Integrations
        #        module DataMapper
        #          version '1.x' do
        #            def persist_model
        #              # model.save
        #            end
        #          end
        #
        #          version '2.x' do
        #            def persist_model
        #              # DataMapper[model.class].persist(model)
        #            end
        #          end
        #        end
        #      end
        #    end
        #
        def version( name, &blk )
          versions << mod = Module.new( &blk )
          mod
        end

        def assign_model_attributes( form_instance, model_instance )
          form_instance.attributes = model_instance.attributes
        end

        # Extend only active versions
        def extended( base )
          versions.select(&:active?).each do |version|
            base.extend(version)
          end
        end
        
      end

      module InstanceMethods

        # Forms hash for current model
        def forms
          @forms ||= FormObject::Base::Collection.new(self)
        end

        # Get form by given name
        def form( name )
          forms[name]
        end

        def form_object_attributes
          Hash.new
        end


      end

      extend ClassMethods
    
      def self.included(receiver)
        receiver.class_eval { extend ClassMethods }
        receiver.class_eval { include InstanceMethods }
      end
    end
  end
end
