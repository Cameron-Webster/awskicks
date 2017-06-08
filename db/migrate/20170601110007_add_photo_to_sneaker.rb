class AddPhotoToSneaker < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :photo, :string
  end
end
