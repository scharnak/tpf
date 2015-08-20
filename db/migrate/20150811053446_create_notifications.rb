class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.text :body

      t.timestamps null: false
    end
  end
end
