class Sneaker < ApplicationRecord

searchkick word_start: [:name], searchable: [:name, :sneak_brand, :style_code]


  has_many :pins
  has_many :vendors, dependent: :destroy
  has_many :buckets, through: :pins
  belongs_to :brand, required: true


  mount_uploader :photo, PhotoUploader
  mount_uploader :alt_photo, PhotoUploader

# paginates_per 2

PRICE_RANGES = [{to: 3000}, {from: 3000, to: 5000}, {from: 5000, to: 8000}, {from: 8000}]

def self.min_price
    Sneaker.order(lowest_price: :asc)[0].lowest_price
end

def self.max_price

  Sneaker.order('lowest_price DESC NULLS LAST')[0].lowest_price

end
end
