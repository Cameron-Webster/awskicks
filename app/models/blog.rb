class Blog < ApplicationRecord

  has_many :promos

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_two, PhotoUploader
  mount_uploader :photo_three, PhotoUploader
end
