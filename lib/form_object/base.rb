module FormObject
  class Base
    require 'form_object/base/mapping_information'
    include Virtus

    extend ActiveModel::Naming
    include Dsl
    include ActiveModel::Conversion
    include ActiveModel::Validations

    # Forms are never themselves persisted
    def persisted?; false; end  

  end
end
