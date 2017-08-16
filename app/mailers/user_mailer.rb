class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)

    @user = user

    mail to: @user.email, subject: 'Welcome to Hymph!'
  end

  def notification_single(user)
      @user = user
      @notifications = @user.notifications
      mail to: @user.email, subject: 'You have new notifcations'
  end
  def notification_daily(user)

     @user = user
      @notifications = @user.notifications
      mail to: @user.email, subject: 'You have new notifcations'

  end

  def notification_weekly(user)
     @user = user
      @notifications = @user.notifications
      mail to: @user.email, subject: 'You have new notifcations'
  end
end
