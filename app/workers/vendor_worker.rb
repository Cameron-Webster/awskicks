  class VendorWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 2

   sidekiq_retry_in do |count|
    1800
   end

  def perform(id)
    puts "Starting Vendor Worker"
    changed_sneakers = Array.new
    vendor = Vendor.find(id)
    sneaker = vendor.sneaker
    vendor.update_price_and_stock

     if vendor.changed
        vendor.save
        sneaker.save
        puts "Vendor/Sneaker saved"
    end

    if sneaker.changed && sneaker.lowest_price < sneaker.previous_lowest_price.to_f
       changed_sneakers << sneaker.id
       puts "starting notifications worker"
       NotificationWorker.perform_async(changed_sneakers)
    end
  end
end
