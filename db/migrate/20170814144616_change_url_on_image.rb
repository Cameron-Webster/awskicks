class ChangeUrlOnImage < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :url, :string
  end
end
