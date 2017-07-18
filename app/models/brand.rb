class Brand < ApplicationRecord
  has_many :sneakers

  mount_uploader :logo, PhotoUploader
end
