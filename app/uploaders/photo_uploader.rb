# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :sneaker if :is_sneaker?
  version :thumb if :is_sneaker?
  version :banner if :is_banner?

  def is_banner?
    model.class == Blog || model.class == Promo
  end

  version :banner do
    process :eager => true
    cloudinary_transformation quality: 100
  end


  def is_sneaker?
    model.class == Sneaker
  end

version :sneaker do
  process :eager => true
  process :resize_to_limit => [450, 700]
  cloudinary_transformation quality: "auto"

end

  version :thumb do
     process :eager => true
    process :resize_to_limit => [245, 365]
  cloudinary_transformation quality: "auto"

  end
end
