# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :eager => true
  process :resize_to_limit => [450, 700]
  cloudinary_transformation qualiy: "auto"

  version :thumb do
     process :eager => true
    process :resize_to_limit => [245, 365]
  cloudinary_transformation qualiy: "auto"

  end
end
