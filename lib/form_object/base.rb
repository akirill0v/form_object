module FormObject
  class Base
    autoload :Collection,         'form_object/base/collection'
    autoload :MappingInformation, 'form_object/base/mapping_information'
    autoload :FormBuilder,        'form_object/base/form_builder'
    include Virtus

    extend ActiveModel::Naming
    include Dsl
    include ActiveModel::Conversion

    # Forms are never themselves persisted
    def persisted?; false; end  

  end
end
