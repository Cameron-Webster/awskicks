class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.text :name
      t.text :logo

      t.timestamps
    end
  end

  def change
    add_reference :sneakers, :brand, foreign_key: true
  end
end
