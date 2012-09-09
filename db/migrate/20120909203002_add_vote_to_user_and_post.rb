class AddVoteToUserAndPost < ActiveRecord::Migration
  def change
    add_column :users, :up_votes, :integer, :null => false, :default => 0
    add_column :users, :down_votes, :integer, :null => false, :default => 0
    add_column :posts, :up_votes, :integer, :null => false, :default => 0
    add_column :posts, :down_votes, :integer, :null => false, :default => 0
  end
end
