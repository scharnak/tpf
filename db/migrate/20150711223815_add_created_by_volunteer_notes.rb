class AddCreatedByVolunteerNotes < ActiveRecord::Migration
  def up
    add_reference :volunteer_notes, :created_by_user, references: :users, index: true
  end
  def down
    remove_reference :volunteer_notes, :created_by_user, index: true
  end
end
