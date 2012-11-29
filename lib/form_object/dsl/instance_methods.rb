module FormObject
  module Dsl
    module InstanceMethods

      def model
        raise ModelUndefinedError.new(self) unless @model
        @model.assign_form_object_attributes(self)
        @model
      end

      def assign_model( model_instance )
        @model = model_instance
        self.attributes = @model.form_object_attributes
      end

    end
  end
end
