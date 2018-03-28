class Wine < ActiveRecord::Base
  has_many :stores_wines
  has_many :stores, through: :stores_wines

  def print
    "#{self.name} - #{self.grape} - $#{self.price}" 
  end

  def add_store(store_id)
    store_id = store_id.to_i
    if self.store_ids.include?(store_id)
      "This wine is already listed at the selected store"
    else
      self.store_ids << store_id
      self.save
      "Wine has been successfully listed"
    end
  end

end