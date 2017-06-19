class Sneaker < ApplicationRecord

searchkick word_start: [:name], searchable: [:name, :brand, :style_code]


  has_many :pins
  has_many :vendors

  mount_uploader :photo, PhotoUploader

# paginates_per 2





end
