class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def destroy

    notification = current_user.notification.where(sneaker_id: params[:id])

    if notification.destroy
      respond_to do |format|
        format.json {head :ok}
      end
    end
  end

end
