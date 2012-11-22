module FormObject
  module Dsl
    module InstanceMethods

      def model
        self.class.model# 
      end
    end
  end
end
