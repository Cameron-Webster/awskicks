# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base


  if Rails.env.development?
    include CarrierWave::MiniMagick
    storage :fog
    prod = false
  else
    include Cloudinary::CarrierWave
    prod = true
  end


  def is_sneaker?(file)
    model.class == Sneaker
  end

  def is_user?(file)
    model.class == User
  end




  process quality: 95


  version :sneaker, :if => :is_sneaker? do
    process :resize_to_limit => [450, 700]
    process quality: 80 if !prod
    cloudinary_transformation quality: 80 if prod
  end

  version :thumb, from_version: :sneaker, :if => :is_sneaker? do
    process :resize_to_limit => [245, 365]
  end


  version :profile, :if => :is_user? do
    process :resize_to_limit => [150, 150]
    process quality: 65 if !prod
    cloudinary_transformation quality: 65 if prod
  end

  version :mini_profile, from_version: :profile, :if => :is_user? do
    process :resize_to_limit => [30, 30]
  end


end
