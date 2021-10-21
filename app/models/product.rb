class Product < ApplicationRecord
  belongs_to :supplier # NEED TO HAVE A TABLE COLUMN NAMED supplier_id
  has_many :images

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
  def tax
    return (price * 0.09)
  end
  def total
    return price + tax
  end
  def images
    images = Image.where(product_id: id)
  end
end
