class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable

  attr_accessible :email, :password, :remember_me

  has_many :posts
end
