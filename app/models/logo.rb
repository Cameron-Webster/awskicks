class Logo < ApplicationRecord

  has_many :vendors

  mount_uploader :photo, PhotoUploader
end
