require 'singleton'

module FormObject
  class Repository
    include Singleton

    def storage
      @storage ||= Hash.new
    end
    
    def map_for_model( form, model, options = {})
      form_name = retrive_form_name(form, options.delete(:as))
      storage[form] = FormObject::Base::Metadata.new( model, form_name, options )
    end

    def []( form )
      storage[form]
    end

    private

    def retrive_form_name( form, name )
      name ||= form.form_name
    end
  end
end
