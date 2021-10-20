class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true, numericality: { greater_than: 0 }
  validates :image_url, presence: true
  validates :description, presence: true, length: { in: 10..500 }
  # validates :inventory, presence: true
  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end
  def tax
    return (price * 0.09)
  end
  def total
    return price + tax
  end
end
