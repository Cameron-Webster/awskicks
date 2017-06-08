class CreateSneakers < ActiveRecord::Migration[5.0]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :style_code
      t.string :image
      t.integer :rrp
      t.integer :average_price
      t.string :color

      t.timestamps
    end
  end
end
