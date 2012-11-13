module FormObject
  class Base
    include Virtus

    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    # Forms are never themselves persisted
    def persisted?; false; end  

  end
end
