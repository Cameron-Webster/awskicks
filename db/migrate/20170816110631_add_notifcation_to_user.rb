class AddNotifcationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_email_send, :datetime
    add_column :users, :marketing_prefs, :boolean
  end
end
