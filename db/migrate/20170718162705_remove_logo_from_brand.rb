class RemoveLogoFromBrand < ActiveRecord::Migration[5.0]
  def change
    change_column :brands, :logo, :string
  end
end
