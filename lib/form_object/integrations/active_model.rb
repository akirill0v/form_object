module FormObject
  module Integrations
    module ActiveModel

      @defaults = {}

      include Base
      extend ClassMethods
      require 'form_object/integrations/active_model/versions'


      def assign_form_object_attributes( form )
        self.assign_attributes( form.attributes )
      end

      def form_object_attributes
        self.attributes
      end
      class << self

        def included( base ) #:nodoc:
          base.versions.unshift(*versions)
        end

        def maching_ancestors
          %w{ActiveModel ActiveModel::Observing ActiveModel::Validations}
        end

        def integrate_form form
          form.class_eval do
            include ::ActiveModel::Validations
          end
        end
      end
    end

  end
end
