class CreateUserSubEvents < ActiveRecord::Migration
  def change
    create_table :user_sub_events do |t|
      t.integer :user_id
      t.integer :sub_event_id

      t.timestamps null: false
    end
  end
end
