class Bucket < ApplicationRecord


  belongs_to :user
  has_many :pins

  accepts_nested_attributes_for :pins
end
