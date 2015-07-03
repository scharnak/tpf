class CreateSubEvents < ActiveRecord::Migration
  def change
    create_table :sub_events do |t|
      t.integer :event_id
      t.string :name
      t.integer :intern_num
      t.integer :staff_num
      t.integer :community_num

      t.timestamps null: false
    end
  end
end
