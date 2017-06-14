class Vendor < ApplicationRecord
  belongs_to :sneaker
  belongs_to :logo
  has_many :sizes

  def update_price_and_stock

    if self.logo.scraper == "static"

      scraper = StaticPageScraper.new(self.url)

    else

      scraper = DynamicPageScraper.new(self.url)

    end

      eval("scraper.extend #{logo.name}")

      scraper.run

      self.current_price = scraper.current_price if self.current_price != scraper.current_price

      unless self.sizes.pluck(:size_uk).to_set == scraper.sizes.to_set

        self.sizes.delete_all

        scraper.sizes.each do |size|
            self.sizes.create(size_uk: size, size_eu: scraper.multiplyer_eu(size, self.sneaker.gender), size_us: scraper.multiplyer_us(size, self.sneaker.gender))
        end
      end


  end

end
