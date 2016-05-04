class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :upvotes
   has_many :comments
   has_many :messages
   has_many :locations
   has_many :posts, :through => :locations
   has_many :politicians, :through => :locations
end
