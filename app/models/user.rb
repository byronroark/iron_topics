class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
     user = where(provider: auth['provider'], uid: auth['uid']).first_or_create

     user.name         = auth.info.name
     user.email        = auth.info.email
     user.nickname     = auth.info.nickname
     user.access_token = auth.credentials.token
     user.password     = Devise.friendly_token[0,20]
     user.save!

     return user
   end
end
