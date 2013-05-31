class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.create_with_omniauth(auth)
    create! do |user|
      user.email = auth["info"]["email"]
      user.password = 'empty_password'
      user.password_confirmation = 'empty_password'
    end
  end


end
