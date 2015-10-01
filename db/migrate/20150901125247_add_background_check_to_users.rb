class AddBackgroundCheckToUsers < ActiveRecord::Migration
  def change
    add_column :users, :background_check, :boolean
    add_column :users, :background_check_date, :date
  end
end
