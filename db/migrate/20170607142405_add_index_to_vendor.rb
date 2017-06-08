class AddIndexToVendor < ActiveRecord::Migration[5.0]
  def change
    add_reference :vendors, :logo, foreign_key: true
  end
end
