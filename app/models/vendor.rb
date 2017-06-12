class Vendor < ApplicationRecord
  belongs_to :sneaker
  belongs_to :logo
  has_many :sizes

end
