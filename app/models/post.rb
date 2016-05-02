class Post < ActiveRecord::Base
  belongs_to :location
  has_many :comments
  has_many :upvotes

  def upvote_count
    upvotes.count
  end

  def vote
    upvotes.count + 1
  end 
end
