module FormObject
  module Dsl
    module ClassMethods

      def repository
        @repository ||= FormObject::Repository.instance
      end
      
      def map_model( model, options = {} )
        repository.map_for_model( self, model, options )
      end
    end
  end
end
