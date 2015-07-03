class CreateVolunteerNotes < ActiveRecord::Migration
  def change
    create_table :volunteer_notes do |t|
      t.integer :user_id
      t.integer :created_by_user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
