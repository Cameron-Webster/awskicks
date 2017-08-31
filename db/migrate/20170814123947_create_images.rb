class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :url
      t.text :name
      t.timestamps
    end
  end


end
