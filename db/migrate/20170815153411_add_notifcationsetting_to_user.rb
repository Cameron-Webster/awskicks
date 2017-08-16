class AddNotifcationsettingToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notification_setting, :integer, default: -1
    change_column :notifications, :read, :boolean, default: false
    change_column :notifications, :price_change, :float
    change_column :pins, :price_watch, :float
    change_column :vendors, :lowest_price, :float

      create_table :promos do |t|
      t.string :image
      t.text :title
      t.text :subtext
      t.text :search_term
      t.boolean :highlight
      t.timestamps
    end
    add_reference :promos, :blog, foreign_key: true, index: true
  end

end
