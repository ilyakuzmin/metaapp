class Post < ActiveRecord::Base
  make_voteable
  
  attr_accessible :body, :title

  belongs_to :user

  validates :title, :body, :user, :presence => true
end
