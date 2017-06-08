class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :current_price
      t.integer :previous_price
      t.string :url
      t.string :logo
      t.integer :lowest_price
      t.references :sneaker, foreign_key: true

      t.timestamps
    end
  end
end
