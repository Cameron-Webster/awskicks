class AddUserRefToPins < ActiveRecord::Migration[5.0]
  def change
    add_reference :pins, :user, foreign_key: true
  end
end
