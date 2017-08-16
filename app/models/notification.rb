class Notification < ApplicationRecord
  after_create :init_home_notifications

  belongs_to :pin
  belongs_to :user
  has_one :homepage_notification, dependent: :destroy

  def init_home_notifications


      HomepageNotification.create(user_id: self.user_id, notification_id: self.id, read: false)

  end
end


