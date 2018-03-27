class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  #Sets user based on data received from Omniauth Facebook Login process
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|   #Finds or creates a user based on the auth.provider (Facebook) and the uid Facebook provides
      binding.pry
      user.name = auth.info.name
      user.email = auth.info.email
      user.image = auth.info.image
      user.password = Devise.friendly_token[0,20]   #This generates a random password for Facebook Login users, assuming they don't want to subsequently set a password
    end      
  end
end
