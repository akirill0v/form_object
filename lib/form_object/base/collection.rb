module FormObject
  class Collection
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
      FormObject::Repository.instance.find(model: @model.class).inject({}){|c, i| c[i.name] = i; c}
    end

    def build_form_instance( name )
      form_class = @form_classes[name].form
    end
  end
end
