class Location < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :politicians
end
