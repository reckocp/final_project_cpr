class PoliticiansController < ApplicationController

  def index
    @politicians = collectPoliticians

    # fixed = Hash[@politicians.first.map do |row|
    #   row['officialIndices'] = row.fetch('officialIndices').map { |n| @politicians[1][n]}
    #   row
    # end]
    #
    # render json: [fixed]
  end

  def addressCheck
    if params[:address].blank?
      redirect_to root_path, alert: "Please enter an address!"
    end
  end

  def collectPoliticians
    address = URI.encode(params[:address])
    response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?address=#{address}&key=#{CI.key}")
    parsed_data = JSON.parse(response.body)
    @offices = parsed_data['offices']
    @officials = parsed_data['officials']

    return [@offices, @officials]
  end



end
