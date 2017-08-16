class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def notification_single
    user = User.first
    UserMailer.notification_single(user)

  end
end

# http://localhost:3000/rails/mailers/user_mailer/welcome to view test
