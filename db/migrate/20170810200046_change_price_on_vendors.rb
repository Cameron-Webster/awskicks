class ChangePriceOnVendors < ActiveRecord::Migration[5.0]
  def change
    change_column :vendors, :current_price, :float
    change_column :vendors, :previous_price, :float
    change_column :sneakers, :lowest_price, :float
  end
end
