class Logo < ApplicationRecord

  has_many :vendors, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
