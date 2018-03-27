class Wine < ActiveRecord::Base
  has_many :stores_wines
  has_many :stores, through: :stores_wines
end