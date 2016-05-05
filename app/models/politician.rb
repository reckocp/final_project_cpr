class Politician < ActiveRecord::Base
  has_many :voting_histories
  include HTTParty

  base_uri 'https://www.googleapis.com/civicinfo/us_v1/'
  default_params fields: "smallIcon,shortDescription"
  format :json

  def self.for politician
    get("", query: { query: politician})["elements"]
  end
end
