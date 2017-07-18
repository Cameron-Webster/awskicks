class Addbrandtosneakers < ActiveRecord::Migration[5.0]
  def change
    remove_column :sneakers, :brand, :string
    add_reference :sneakers, :brand, foreign_key: true
  end
end
