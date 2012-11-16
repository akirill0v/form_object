module FormObject
  module Integrations
    module ActiveModel
      include Base

      def self.matching_ancestors
        %w(ActiveModel ActiveModel::Observing ActiveModel::Validations)
      end

    end
  end
end
