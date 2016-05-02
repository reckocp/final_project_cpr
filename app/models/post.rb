class Post < ActiveRecord::Base
  belongs_to :location
  has_many :comments
  has_many :upvotes
end
