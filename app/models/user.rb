class User < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :upvotes
  has_many :comments
  has_many :sender_conversations, foreign_key: :sender_id, class_name: :Conversation
  has_many :recipient_conversations, foreign_key: :recipient_id, class_name: :Conversation
  has_many :posts
  has_many :events
  has_many :spotlights

  def conversations
     sender_conversations | recipient_conversations
  end

  def address
    [street, city, state, zip].compact.join(', ')
  end
end
