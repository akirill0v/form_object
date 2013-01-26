require 'singleton'

module FormObject
  class Store
    include Singleton

    def storage
      @storage ||= Set.new
    end
    
    def map_for_model( form, model, options = {})
      form_name = retrive_form_name(form, options.delete(:as))
      storage << FormObject::Base::MappingInformation.new(form, model, form_name, options )
      include_integration( form, model )
    end

    def find(critery = {})
      storage.select{|mapping_info| mapping_info.match?(critery)}
    end

    private

    def retrive_form_name( form, name )
      name ||= form.form_name
    end

    def include_integration( form, model_class )
      integration = FormObject::Integrations.match(model_class)
      unless integration.nil?
        integration.integrate_form form
        model_class.send(:include, integration)
      end
    end
  end
end
