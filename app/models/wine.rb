class Wine < ActiveRecord::Base
  has_many :comments
  has_many :stores_wines
  has_many :stores, through: :stores_wines
  accepts_nested_attributes_for :stores_wines

  validates :name, :price, :grape, :description, presence: true
  validates :color, presence: true, inclusion: { in: %w(Red White), message: "Must be either 'Red' or 'White'"}

  def print
    "#{self.name} - #{self.grape} - $#{self.price}" 
  end

  def add_store(params)
    store_id = params[:stores_wines_attributes][:"0"][:store_id].to_i
    inventory = params[:stores_wines_attributes][:"0"][:inventory].to_i
    if self.store_ids.include?(store_id)
      "This wine is already listed at the selected store"
    else
      self.stores_wines.build(store_id: store_id, wine_id: self.id, inventory: inventory)
      self.save
      "Wine has been successfully listed"
    end
  end

  def inventory_by_store(store)
    store.stores_wines.where(wine_id: self.id).pluck(:inventory)[0]
  end

  def stores_wine_by_store(store_id)
    self.stores_wines.where(store_id: store_id)
  end

  def self.varietals
    Wine.select(:grape).map(&:grape).uniq
  end

  def self.by_varietal(varietal)
    Wine.where(grape: varietal)
  end

end