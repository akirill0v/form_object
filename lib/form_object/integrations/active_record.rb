require 'form_object/integrations/active_model'

module FormObject
  module Integrations
    module ActiveRecord

      @defaults = {}

      include Base
      include ActiveModel
      require 'form_object/integrations/active_record/versions'
      require 'active_model/validations'

      class << self

        def extended( base ) #:nodoc:
          require 'active_record/version'
          super
        end

        def matching_ancestors
          %w{ActiveRecord::Base}
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
