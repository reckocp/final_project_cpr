class Event < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  def address
    user.address
  end 
end
