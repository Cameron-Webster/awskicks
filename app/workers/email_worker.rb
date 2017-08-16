class EmailWorker
  include Sidekiq::Worker

  def perform(user_list = [])

    if user_list.empty?

      users = User.all

    else

      users = User.where(id: user_list)

    end

    users.each do |user|

      mail_freq = user.notification_setting

      unless mail_freq < 0

        timing = Time.now.to_i - user.last_email_send.to_i - mail_freq

        if timing > 0

          UserMailer.notification_single(user).deliver_now
        else

          timing = timing.abs + time.now.to_i

          UserMailer.notification_single(user).deliver_later(timing)

        end
      end
  end
end
end
