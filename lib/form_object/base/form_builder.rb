module FormObject
  class Base::FormBuilder
    attr_reader :mapping_information, :attributes

    def initialize( mapping_information, attributes = {} )
      @mapping_information, @attributes = mapping_information, attributes
    end

    def build
      form_instance
    end

    protected

    def form_instance
      @form_instance ||= assign_attributes(empty_form)
    end

    def empty_form
      @mapping_information.form.new
    end

    def assign_attributes( form_instance )
      form_instance.attributes = @attributes
      form_instance
    end

  end
end
