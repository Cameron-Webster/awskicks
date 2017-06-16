class AddBrandToSneaker < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :brand, :string
    remove_column :sneakers, :average_price
    add_column :sneakers, :lowest_price, :integer
    remove_column :sneakers, :rrp
    remove_column :sneakers, :image
  end
end
