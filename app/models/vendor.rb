class Vendor < ApplicationRecord
  belongs_to :sneaker
  belongs_to :logo
  has_many :available_sizes, dependent: :destroy

  IP_ADDRESSES = [['173.211.73.55', 'Mac Safari'],
                  ['173.211.74.128', 'Mac Safari'],
                  ['184.174.77.2', 'Mac Safari'],
                  ['173.211.72.68', 'Mac Safari'],
                  ['173.211.75.164','Mac Safari'],
                  ['184.174.77.22', "Mozilla/5.0 (Macintosh; Intel Mac OS X)"],
                  ['173.211.72.121', "Mozilla/5.0 (Macintosh; Intel Mac OS X)"],
                  ['184.174.78.73', "Mozilla/5.0 (Macintosh; Intel Mac OS X)"],
                  ['173.211.72.38', "Mozilla/5.0 (Macintosh; Intel Mac OS X)"],
                  ['184.174.79.77',"Mozilla/5.0 (Macintosh; Intel Mac OS X)"],
                  ['184.174.79.15',"Mozilla/5.0 (Macintosh; Intel Mac OS X)"]]

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
        self.current_price = scraper.current_price
        end

        unless self.available_sizes.pluck(:size_uk).to_set == scraper.sizes.to_set

          self.available_sizes.delete_all

          scraper.sizes.each do |size|

              self.available_sizes.create(size_uk: size)
          end
        end

        sneak = self.sneaker

        sneak.lowest_price = sneak.vendors.order(current_price: :asc)[0].current_price

  end

end
