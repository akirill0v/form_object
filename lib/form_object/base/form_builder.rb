module FormObject
  class Base::FormBuilder
    attr_reader :mapping_information, :model

    def initialize( mapping_information, model )
      @mapping_information, @model = mapping_information, model
    end

    def build
      form_instance
    end

    protected

    def form_instance
      @form_instance ||= assign_model_attributes(empty_form)
    end

    def empty_form
      @mapping_information.form.new
    end

    def assign_model_attributes( form_instance )
      form_instance.assign_model( @model )
      form_instance
    end

  end
end
