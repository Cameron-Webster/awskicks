class HomepageNotificationsController < ApplicationController

    def read
    if current_user
      current_user.homepage_notifications.where(read: false)&.each do |n|
        n.read = true
        n.save
        destroy if current_user.homepage_notifications.count > 20
      end
    end
  end

  def destroy
    current_user.homepage_notifications.first(10).destroy_all
  end

end
