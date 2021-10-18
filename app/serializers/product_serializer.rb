class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :is_discounted?, :tax, :total
end
