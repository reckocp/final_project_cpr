class Politician < ActiveRecord::Base
  belongs_to :location
  has_many :voting_histories
end
