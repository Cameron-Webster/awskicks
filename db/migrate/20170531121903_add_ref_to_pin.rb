class AddRefToPin < ActiveRecord::Migration[5.0]
  def change
    add_reference :pins, :bucket, foreign_key: true
    add_reference :pins, :sneaker, foreign_key: true
  end
end
