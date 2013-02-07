module FormObject
  class Base
    MappingInformation = Struct.new(:form, :model, :name, :options) do

      # Matching MappingInformation by critery
      def match?( critery = {} )
        critery.each do |k, v|
          return false unless self[k] == v
        end
        true
      end

    end
  end
end
