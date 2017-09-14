class NotificationWorker

  include Sidekiq::Worker

  def perform(arr)

    sneakers = Sneaker.where(id: arr)

    unless sneakers.empty?

      sneakers.each do |sneak|

        sneak.pins.reject{|pn| pn.price_watch.nil? || pn.price_watch < sneak.lowest_price }.each do |pin|

            Notification.create(pin_id: pin.id, user_id: pin.bucket.user.id, action: "#{sneak.name} has fallen to #{sneak.lowest_price}")

        end

      end

    end

  end
end


   # users = sneakers.map{|sn| sn.pins.map{|pin| pin.bucket.user}}.uniq.flatten
   #    users.each do |user|
   #      user.pins.each do |pin|
   #        if pin.price_watch >= pin.sneaker.lowest_price
   #          sneak = pin.sneaker
   #          Notification.create(pin_id: pin.id, user_id: user.id, action: "#{sneak.name} has fallen to #{sneak.lowest_price}")
   #        end
   #      end
   #    end
