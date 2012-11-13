class Filter < FormObject::Base
  attribute :query, String

  validates :query, presence: true
end
