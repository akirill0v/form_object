module FormObject

  class MappingInformationNotFound < RuntimeError
    def initialize( critery )
      super "#{critery.inspect} not found"
    end
  end

  class Base::Collection
    attr_reader :model, :form_classes
    
    def initialize( model )
      @model = model
      @form_classes = find_form_classes
    end

    def []( name )
      build_form_instance(name)
    end

    protected

    def find_form_classes
      FormObject::Store.instance.find(model: @model.class).inject({}){|c, i| c[i.name] = i; c}
    end

    def build_form_instance( name )
      mapping_information = @form_classes[name]
      raise MappingInformationNotFound.new(mapping_information) if mapping_information.nil?
      FormObject::Base::FormBuilder.new(mapping_information, @model.attributes).build
    end
  end
end
