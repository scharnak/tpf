class AddCompletedAtToEventSubEvent < ActiveRecord::Migration
  def change
    add_column :events, :completed_at, :datetime
    add_column :sub_events, :completed_at, :datetime
  end
end
