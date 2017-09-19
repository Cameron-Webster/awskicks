class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :buckets
  has_many :notifications
  has_many :homepage_notifications

  # mount_uploader :profile_pic, PhotoUploader


end
