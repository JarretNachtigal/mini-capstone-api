class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :product # can only order 1 thing at a time
  has_many :products, through: :CartedProducts
end
