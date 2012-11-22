module FormObject
  module Dsl
    module ClassMethods
      
      def map_model( model, options = {} )
        repository.map_for_model( self, model, options )
      end

      def form_name
        FormObject::Utils::StringConverter.form_name(self.name).to_sym
      end

      def model
        repository[self].try(:model)
      end

      protected

      def repository
        @repository ||= FormObject::Repository.instance
      end

    end
  end
end
