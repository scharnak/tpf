class CreateSubEventTypes < ActiveRecord::Migration
  def change
    create_table :sub_event_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
