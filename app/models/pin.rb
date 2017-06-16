class Pin < ApplicationRecord

  belongs_to :bucket, dependent: :destroy
  belongs_to :sneaker
  has_many :notifications

  def add_stockwatch

  end
end
