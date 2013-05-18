module FormObject
  module Dsl
    module ClassMethods

      def map_model( model_class, options = {} )
        store.map_for_model( self, model_class, options )
      end

      def form_name
        FormObject::Utils::StringConverter.form_name(self.name).to_sym
      end

      def model
        store.find(form: self).first.try(:model)
      end

      protected

      def store
        FormObject::Store.instance
      end

    end
  end
end
