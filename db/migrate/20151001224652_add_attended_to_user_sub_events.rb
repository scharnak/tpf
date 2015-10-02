class AddAttendedToUserSubEvents < ActiveRecord::Migration
  def change
    add_column :user_sub_events, :attended, :boolean, default: false
  end
end
