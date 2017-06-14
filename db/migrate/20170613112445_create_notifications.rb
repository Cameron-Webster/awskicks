class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :pin, foreign_key: true
      t.boolean :read
      t.string :action
      t.integer :price_change

      t.timestamps
    end
  end
end
