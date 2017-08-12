class SpiderWorker
  include Sidekiq::Worker

  def perform(id = nil)
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

    else
     Sneaker.all.each do |sneaker|
        sneaker.vendors.each do |vendor|
            vendor.update_price_and_stock
            if vendor.changed
            vendor.save
            end
        end
        sneaker.save
      end
    end
  end
end
