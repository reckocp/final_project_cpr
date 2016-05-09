class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :upvotes
   has_many :comments
   has_many :sender_conversations, foreign_key: :sender_id, class_name: :Conversation
   has_many :recipient_conversations, foreign_key: :recipient_id, class_name: :Conversation
   has_many :posts


  def conversations
     sender_conversations | recipient_conversations
  end
end
