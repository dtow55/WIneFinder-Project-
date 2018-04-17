class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :color, :grape
  has_many :stores
  has_many :comments
end
