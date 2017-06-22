class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :subtitle
      t.text :content
      t.string :photo
      t.string :photo_two
      t.string :photo_three
      t.string :author
      t.boolean :highlight

      t.timestamps
    end
    add_index :blogs, :highlight, where: "highlight = true"
  end

end
