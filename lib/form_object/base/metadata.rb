module FormObject
  class Base
    class Metadata
      attr_accessor :model, :name, :options

      def initialize( args = {} )
        @model = args.delete(:model)
        @name = args.delete(:name)
        @options = args.delete(:options)
      end

    end
  end
end
