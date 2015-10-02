class RemoveCompletedFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :completed
  end
end
