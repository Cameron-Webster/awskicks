class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.float :size_uk
      t.float :size_us
      t.float :size_eu
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
