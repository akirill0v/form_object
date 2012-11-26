module FormObject
  module Dsl
    module ClassMethods
      
      def map_model( model_class, options = {} )
        repository.map_for_model( self, model_class, options )
      end

      def form_name
        FormObject::Utils::StringConverter.form_name(self.name).to_sym
      end

      def model
        repository.find(form: self).first.try(:model)
      end

      protected

      def repository
        FormObject::Repository.instance
      end

    end
  end
end
