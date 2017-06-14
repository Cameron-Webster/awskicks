class Pin < ApplicationRecord
  validates :description, presence: true
  belongs_to :bucket, dependent: :destroy
  belongs_to :sneaker
  has_many :notifications


end
