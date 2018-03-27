class Store < ActiveRecord::Base
  belongs_to :user
  has_many :stores_wines
  has_many :wines, through: :stores_wines
end