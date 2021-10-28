class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products


  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { in: 10..500 }

  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end
  def subtotal(quantity=1)
    return price * quantity
  end
  def tax(quantity=1)

    return (subtotal(quantity) * 0.09)
  end
  def total(quantity=1)

    return subtotal(quantity) + tax(quantity)
  end
  def images
    images = Image.where(product_id: id)
  end
end
