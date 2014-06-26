class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me


  def self.create_with_omniauth(auth)
    create! do |user|
      if auth['info']['email']
        user.email = auth['info']['email']
      else
        token = auth['info']['token']
        user.email = "#{token}@mail.ru"
      end
      
      user.password = 'empty_password'
      user.password_confirmation = 'empty_password'
    end
  end
end
