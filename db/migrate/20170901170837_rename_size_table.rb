class RenameSizeTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :sizes, :available_sizes
  end
end
