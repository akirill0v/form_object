module FormObject
  module Integrations
    module ActiveModel

      def self.included( base ) #:nodoc:
        base.versions.unshift(*versions)
      end

      include Base
      extend ClassMethods
      require 'form_object/integrations/active_model/versions'

      @defaults = {}

      def self.maching_ancestors
        %w{ActiveModel ActiveModel::Observing ActiveModel::Validations}
      end

      def assign_form_object_attributes( form )
        self.assign_attributes( form.attributes )
      end

      def form_object_attributes
        self.attributes
      end
      
    end
  end
end
