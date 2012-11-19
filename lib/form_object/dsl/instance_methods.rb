module FormObject
  module Dsl
    module InstanceMethods

      def model
        self.class.repository[self.class].try(:model)
      end
    end
  end
end
