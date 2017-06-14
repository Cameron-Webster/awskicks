class AddGenderToSneaker < ActiveRecord::Migration[5.0]
  def change
    add_column :sneakers, :gender, :string
  end
end
