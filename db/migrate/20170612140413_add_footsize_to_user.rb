class AddFootsizeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :footsize, :float
    add_column :users, :region, :string
  end
end
