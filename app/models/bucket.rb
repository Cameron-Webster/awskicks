class Bucket < ApplicationRecord


  belongs_to :user
  has_many :pins, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :pins
end
