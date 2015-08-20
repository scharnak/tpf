class AddJoinsToSubEventDescriptionJoins < ActiveRecord::Migration
  def change
    add_column :sub_event_description_joins, :sub_event_type_id, :integer
    add_column :sub_event_description_joins, :sub_event_description_id, :integer
  end
end
