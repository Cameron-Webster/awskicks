class AddPriceToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :price_watch, :integer
    add_column :pins, :stock_watch, :float
  end
end
