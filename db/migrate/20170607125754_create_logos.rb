class CreateLogos < ActiveRecord::Migration[5.0]
  def change
    create_table :logos do |t|
      t.string :name
      t.string :photo
      t.string :home_url

      t.timestamps
    end
  end
end
