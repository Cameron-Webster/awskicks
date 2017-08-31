class CreateHomepageNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :homepage_notifications do |t|
      t.boolean :read
      t.references :user, foreign_key: true
      t.references :notification, foreign_key: true
      t.timestamps
    end
    add_index :homepage_notifications, :read, where: "read = false"
  end
end

