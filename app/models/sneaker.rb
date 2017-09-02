class Sneaker < ApplicationRecord
after_initialize :init


searchkick word_start: [:name], searchable: [:name, :sneak_brand, :style_code]


  has_many :pins, dependent: :destroy
  has_many :vendors, dependent: :destroy
  has_many :buckets, through: :pins
  belongs_to :brand, required: true
  has_many :available_sizes, through: :vendors

  mount_uploader :photo, PhotoUploader
  mount_uploader :alt_photo, PhotoUploader

  def search_data
    {
      name: name,
      sneak_brand: sneak_brand,
      style_code: style_code,
      available_sizes: available_sizes,
      gender: gender,
      created_at: created_at,
      lowest_price: lowest_price
    }
  end



    def init
      self.style_code  ||= "style-#{Sneaker.last.id + 1}"       #will set the default value only if it's nil
    end

# paginates_per 2

PRICE_RANGES = [{to: 3000}, {from: 3000, to: 5000}, {from: 5000, to: 8000}, {from: 8000}]

def self.min_price
    Sneaker.order(lowest_price: :asc)[0].lowest_price
end

def self.max_price

  Sneaker.order('lowest_price DESC NULLS LAST')[0].lowest_price

end
end
