class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :color, :grape
end
