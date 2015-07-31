class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :preference_type_id
      t.string :name

      t.timestamps null: false
    end
  end
end
