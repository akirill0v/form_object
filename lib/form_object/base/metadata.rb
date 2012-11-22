module FormObject
  class Base
    Metadata = Struct.new(:form, :model, :name, :options) do

      def match?( critery = {} )
        critery.each do |k, v|
          return false unless self[k] == v
        end
        true
      end

    end
  end
end
