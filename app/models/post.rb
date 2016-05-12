class Post < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  belongs_to :user
  has_many :comments
  has_many :upvotes

  def upvote_count
    upvotes.count
  end

  def vote
    upvotes.count + 1
  end

  def address
    user.address
  end
end
