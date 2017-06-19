class AddIndexToSneakers < ActiveRecord::Migration[5.0]
  def change
    add_index :sneakers, :brand
    add_index :sneakers, :style_code, unique: true
    add_index :sneakers, :name
    add_index :sneakers, :gender
    add_index :sneakers, :color
    add_index :sneakers, :lowest_price
  end
end
