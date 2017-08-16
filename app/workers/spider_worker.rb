class SpiderWorker
  include Sidekiq::Worker

  def perform(id = nil)
    changed_sneakers = Array.new
    puts "starting Spider Worker"
    if id
      sneaker = Sneaker.find(id)

        sneaker.vendors.each do |vendor|
          puts "in Vendor Loop"
            vendor.update_price_and_stock
            if vendor.changed
            vendor.save
            end
        end
        sneaker.save
         if sneaker.current_price_changed? && sneaker.current_price < sneaker.previous_price
          changed_sneakers << sneaker.id
        end

    else
     Sneaker.all.each do |sneaker|
        sneaker.vendors.each do |vendor|
            vendor.update_price_and_stock
            if vendor.changed
            vendor.save
            end
        end
        sneaker.save
        if sneaker.current_price_changed? && sneaker.current_price < sneaker.previous_price
          changed_sneakers << sneaker.id
        end

      end
    end
    NotificationWorker.perform_async(changed_sneakers)
  end
end
