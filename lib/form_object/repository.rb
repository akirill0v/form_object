require 'singleton'

module FormObject
  class Repository
    include Singleton

    def storage
      @storage ||= Hash.new
    end
    
    def map_for_model( form, model, options = {})
      form_name = retrive_form_name(model, options.delete(:name))
      storage[form] = FormObject::Base::Metadata.new(model: model, name: form_name, options: options)
    end

    def []( form )
      storage[form]
    end

    private

    def retrive_form_name( model, name )
      name ||= model.class.name
    end
  end
end
