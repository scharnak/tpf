class AddTimesToSubEvents < ActiveRecord::Migration
  def change
    add_column :sub_events, :start_time, :datetime
    add_column :sub_events, :end_time, :datetime
  end
end
