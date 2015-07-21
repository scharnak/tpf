class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state, default: "IN"
      t.string :zipcode
      t.string :phone
      t.timestamps null: false
    end
  end
end
