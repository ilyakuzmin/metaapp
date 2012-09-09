class User < ActiveRecord::Base
  make_voter
  
  devise :database_authenticatable, :rememberable

  attr_accessible :email, :password, :remember_me

  has_many :posts
end
