class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :zipcode
      t.integer :user_id
      t.string :nickname

      t.timestamps

    end
  end
end
