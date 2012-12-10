module FormObject
  module Dsl
    module InstanceMethods

      # Return instance of assocoated model class
      # It can be nil if form associated with non-ORM model (with poro)
      def model
        raise ModelUndefinedError.new(self) unless @model
        @model.assign_form_object_attributes(self)
        @model
      end

      # Assign model for form instance
      # And assign attributes to form object
      def assign_model( model_instance )
        @model = model_instance
        self.attributes = @model.form_object_attributes
      end

      # Assign attributes to form object
      # == Example:
      #    form = BasicAuthForm.new
      #    form.assign_attributes( params[:authenticate] )
      #
      #    form.attributes # => updated with params hash
      #
      def assign_attributes( attributes = {} )
        self.attributes = attributes if attributes.keys.any?
      end
    end
  end
end
