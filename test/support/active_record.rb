require 'active_record'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

ActiveRecord::Migration.create_table :users do |t|
  t.string :email
  t.string :name
  t.timestamps
end

class User < ActiveRecord::Base
  # Without form validations.
  # Only Domain Validations
end

class BaseAuthForm < FormObject::Base
  map_model User

  attribute :email, String

  validates :email, :presence => true
end

class TwitterAuthForm < FormObject::Base
  map_model User, :as => :twitter
end
