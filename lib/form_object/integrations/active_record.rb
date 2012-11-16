module FormObject
  module Integrations
    module ActiveRecord
      include Base
      
      def self.matching_ancestors
        %w(ActiveRecord::Base)
      end

    end
  end
end
