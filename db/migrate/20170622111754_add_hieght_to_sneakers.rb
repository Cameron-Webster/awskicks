class AddHieghtToSneakers < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :photo_height, :integer
    add_column :sneakers, :alt_photo, :string
  end

end
