class User < ActiveRecord::Base
  validates :password, confirmation: true
  has_many :upvotes
  has_many :comments
  has_many :messages
  has_many :locations
  has_many :posts, :through => :locations
  has_many :politicians, :through => :locations
end
