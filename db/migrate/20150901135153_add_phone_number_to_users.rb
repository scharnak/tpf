class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phonenumber, :string, limit: 30
  end
end
