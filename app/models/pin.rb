class Pin < ApplicationRecord

  belongs_to :bucket, required: false
  belongs_to :sneaker
  has_many :notifications, dependent: :destroy

  def add_stockwatch

  end
end
