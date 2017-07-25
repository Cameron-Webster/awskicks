class AddColumnToSneaker < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :sneak_brand, :string
    add_index :sneakers, :sneak_brand
  end
end
