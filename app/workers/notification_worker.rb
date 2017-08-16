class NotificationWorker

  include Sidekiq::Worker

  def perform(arr)

    sneakers = Sneaker.where(id: arr)

    unless sneakers.empty?

      users = sneakers.map{|sn| sn.pins.map{|pin| pin.bucket.user}}.uniq.flatten

      users.each do |user|

        user.pins.each do |pin|

          if pin.price_watch >= pin.sneaker.lowest_price

            sneak = pin.sneaker

            Notification.create(pin_id: pin.id, user_id: user.id, action: "#{sneak.name} has fallen to #{sneak.lowest_price}")

          end

        end

      end

    end

  end
end
