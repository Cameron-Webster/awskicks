class Vendor < ApplicationRecord
  belongs_to :sneaker
  belongs_to :logo
  has_many :available_sizes, dependent: :destroy

  def uk_available
    list = self.available_sizes.map {|size| size.size_uk}

    if list.empty?
     ["out of stock"]
    elsif list[0] == 0.0
      ["Check Website for Stock Availability"]
    else
      list
    end
  end

  def update_price_and_stock

    if self.logo.scraper == "static"

      scraper = StaticPageScraper.new(self.url)

    else

      scraper = DynamicPageScraper.new(self.url)

    end

      eval("scraper.extend #{logo.name}")

      scraper.run

      unless scraper.current_price < 1
      self.current_price = scraper.current_price if self.current_price.nil? || self.current_price != scraper.current_price
      end

      unless self.available_sizes.pluck(:size_uk).to_set == scraper.sizes.to_set

        scraper.sizes.each do |sz|
          puts sz
        end

        self.available_sizes.delete_all

        scraper.sizes.each do |size|
      # self.sizes.create(size_uk: size, size_eu: scraper.multiplyer_eu(size, self.sneaker.gender), size_us: scraper.multiplyer_us(size, self.sneaker.gender))
          # puts size
            self.available_sizes.create(size_uk: size)
        end
      end

      if self.sneaker.lowest_price.nil? || self.current_price < self.sneaker.lowest_price
        self.sneaker.previous_lowest_price = self.sneaker.lowest_price
        self.sneaker.lowest_price = current_price
      end
  end

end
