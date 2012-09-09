class Post < ActiveRecord::Base
  make_voteable

  attr_accessible :body, :title

  belongs_to :user

  validates :title, :body, :user, :presence => true

  def self.all_ordered
    find(:all, :include => :user, :order => "up_votes - down_votes DESC")
  end
end
