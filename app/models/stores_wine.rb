class StoresWine < ActiveRecord::Base
  belongs_to :store
  belongs_to :wine
end