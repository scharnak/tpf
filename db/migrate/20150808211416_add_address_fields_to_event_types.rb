class AddAddressFieldsToEventTypes < ActiveRecord::Migration
  def change
  	add_column :event_types, :street, :string
  	add_column :event_types, :city, :string
  	add_column :event_types, :state, :string
  	add_column :event_types, :zip_code, :integer
  end
end
