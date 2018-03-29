class Wine < ActiveRecord::Base
  has_many :stores_wines
  has_many :stores, through: :stores_wines
  accepts_nested_attributes_for :stores_wines

  validates :name, :price, :grape, :description, presence: true
  validates :color, presence: true, inclusion: { in: %w(Red White), message: "Must be either 'Red' or 'White'"}

  def print
    "#{self.name} - #{self.grape} - $#{self.price}" 
  end

  def add_store(store_id)
    store_id = store_id.to_i
    if self.store_ids.include?(store_id)
      "This wine is already listed at the selected store"
    else
      binding.pry
      self.stores << Store.find(store_id)
      self.save
      "Wine has been successfully listed"
    end
  end

  def self.varietals
    Wine.select(:grape).map(&:grape).uniq
  end

  def self.by_varietal(varietal)
    Wine.where(grape: varietal)
  end

end