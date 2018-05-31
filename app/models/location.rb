class Location < ApplicationRecord
  # Direct associations

  belongs_to :users,
             :class_name => "User",
             :foreign_key => "user_id"

  # Indirect associations

  # Validations

end
