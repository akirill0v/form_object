require 'form_object/integrations/active_model'

module FormObject
  module Integrations
    module ActiveRecord
      
      include Base
      include ActiveModel
      require 'form_object/integrations/active_record/versions'

      @defaults = {}

      def self.extended( base ) #:nodoc:
        require 'active_record/version'
        super
      end

      def self.matching_ancestors
        %w{ActiveRecord::Base}
      end

    end
  end
end
