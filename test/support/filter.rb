class Filter < FormObject::Base
  attribute :query, String
  attribute :created_at, DateTime, default: Proc.new{ DateTime.now }

  # This form not mapped for any ORM model
  # You should add validations manualy
  include ActiveModel::Validations
  validates :query, presence: true
end
