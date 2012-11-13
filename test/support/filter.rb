class Filter < FormObject::Base
  attribute :query, String
  attribute :created_at, DateTime, default: Proc.new{ DateTime.now }

  validates :query, presence: true
end
