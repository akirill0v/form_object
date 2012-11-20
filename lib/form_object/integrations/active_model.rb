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
      
    end
  end
end
