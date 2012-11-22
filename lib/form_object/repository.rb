require 'singleton'

module FormObject
  class Repository
    include Singleton

    def storage
      @storage ||= Set.new
    end
    
    def map_for_model( form, model, options = {})
      form_name = retrive_form_name(form, options.delete(:as))
      storage << FormObject::Base::Metadata.new(form, model, form_name, options )
      include_integration( model )
    end

    def find(critery = {})
      storage.select{|meta| meta.match?(critery)}
    end

    private

    def retrive_form_name( form, name )
      name ||= form.form_name
    end

    def include_integration( model_class )
      integration = FormObject::Integrations.match(model_class)
      model_class.send(:include, integration) unless integration.nil?
    end
  end
end
