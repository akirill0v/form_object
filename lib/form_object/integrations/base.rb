module FormObject
  module Integrations
    module Base
      module ClassMethods
        # The default options to use for state machines using this integration
        attr_reader :defaults
        
        # FormsCollection for this model
        #
        # == Example
        #
        #   class BaseForm < FormObject::Base
        #     model User
        #   end
        #
        #   class TwitterForm < FormObject::Base
        #     model User, as: :twitter
        #   end
        #
        #   @user = User.new
        #   @base_form = @user.forms[:base]       # => instance of BaseForm
        #   @twitter_form = @iser.forms[:twitter] # => instance of TwitterForm
        #
        # Forms must have names. If the form name is not specified, it is taken
        # from class name.
        def forms
          nil
        end

        # The name of the integration
        def integration_name
          @integration_name ||= begin
            name = self.name.split('::').last
            name.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
            name.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
            name.downcase!
            name.to_sym
          end
        end
        
        # Whether this integration is available for the current library.  This
        # is only true if the ORM that the integration is for is currently
        # defined.
        def available?
          matching_ancestors.any? && Object.const_defined?(matching_ancestors[0].split('::')[0])
        end
        
        # The list of ancestor names that cause this integration to matched.
        def matching_ancestors
          []
        end

        # Whether the integration should be used for the given class.
        def matches?(klasses)
          ancestor_names = klasses.map {|klass| klass.ancestors.map(&:name)}
          matches_ancestors?(ancestor_names)
        end

        # Whether the integration should be used for the given list of ancestors.
        def matches_ancestors?(ancestors)
          (ancestors & matching_ancestors).any?
        end

        # The path to the locale file containing translations for this
        # integration.  This file will only exist for integrations that actually
        # support i18n.
        def locale_path
          path = "#{File.dirname(__FILE__)}/#{integration_name}/locale.rb"
          path if File.exists?(path)
        end

        # Extends the given object with any version overrides that are currently 
        # active
        def extended(base)
          versions.each do |version|
             base.extend(version) if version.active?
          end
        end

        # Defined versions
        def versions
          @versions ||= []
        end

        # DSL for define version and version based methods
        #
        def version( name, &block )
          mod = Module.new(&block)
          versions << mod
          mod
        end

      end

      extend ClassMethods
    
      module InstanceMethods

        # FormsCollection for this model
        def forms
          self.class.forms
        end
      end
    
      def self.included(receiver) #:nodoc:
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end
