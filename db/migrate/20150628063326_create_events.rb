class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type_id
      t.string :name

      t.timestamps null: false
    end
  end
end
