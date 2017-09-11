class AddShoeStyleToSneakers < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :shoe_style, :string
    add_column :sneakers, :primary_color, :string
    add_column :logos, :display_name, :string
  end
end
