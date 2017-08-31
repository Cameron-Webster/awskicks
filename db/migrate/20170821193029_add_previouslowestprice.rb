class AddPreviouslowestprice < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :previous_lowest_price, :float
  end
end
