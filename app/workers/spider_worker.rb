class SpiderWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 2

   sidekiq_retry_in do |count|
    1800
   end

  def perform(id)
    sleep(rand(1..3))
    changed_sneakers = Array.new
    puts "starting Spider Worker"
    if id.class == Fixnum
      sneaker = Sneaker.find(id)

        sneaker.vendors.each do |vendor|
          puts "in Vendor Loop"
            vendor.update_price_and_stock
            if vendor.changed
            vendor.save
            end
        end
        sneaker.save
         if sneaker.changed && sneaker.lowest_price < sneaker.previous_lowest_price.to_f
          changed_sneakers << sneaker.id
        end

    elsif id.class == Array
     Sneaker.where(id: id).each do |sneaker|
        sneaker.vendors.each do |vendor|
            vendor.update_price_and_stock
            if vendor.changed
            vendor.save
            end
        end
        sneaker.save
        if sneaker.changed && sneaker.lowest_price < sneaker.previous_lowest_price.to_f
          changed_sneakers << sneaker.id
        end

      end
    end
    NotificationWorker.perform_async(changed_sneakers)
  end
end
