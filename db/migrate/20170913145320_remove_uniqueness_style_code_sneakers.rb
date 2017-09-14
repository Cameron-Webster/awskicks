class RemoveUniquenessStyleCodeSneakers < ActiveRecord::Migration[5.0]
  def change
    remove_index :sneakers, :style_code
    add_index :sneakers, :style_code
  end
end
