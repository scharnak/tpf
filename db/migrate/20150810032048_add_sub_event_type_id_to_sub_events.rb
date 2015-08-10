class AddSubEventTypeIdToSubEvents < ActiveRecord::Migration
  def change
    add_column :sub_events, :sub_event_type_id, :integer
  end
end
