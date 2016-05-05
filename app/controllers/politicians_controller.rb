class PoliticiansController < ApplicationController

  def index
    @politicians = collectPoliticians
    if params[:address].blank?
      redirect_to root_path, alert: "Please enter an address!"
    end
    reps = collectPoliticians
    officials = reps[1]
    offices = {}
    offices[:localOffices] = []
    offices[:stateOffices] = []
    offices[:nationalOffices] = []
    reps[0].each do |k, office|
      if offices['levels'] == 'country'
        offices[:nationalOffices] << office
      elsif offices['levels'] == 'administrativeArea1'
        offices[:stateOffices] << office
      else
        offices[:localOffices] << office
      end
    end
    # offices.each do |k, v|
    #   v.to_enum.with_index(0).each do |a, index|
    #     p = a['officialIds']
    #     official = eval(officials[p[0]].to_s)
    #     offices[k.to_sym][index]['official_name'] = official['name']
    #     offices[k.to_sym][index]['official_address'] = official['address']
    #     offices[k.to_sym][index]['official_phones'] = official['phones']
    #     offices[k.to_sym][index]['official_urls'] = official['urls']
    #     offices[k.to_sym][index]['official_emails'] = official['emails']
    #     offices[k.to_sym][index]['official_party'] = official['party']
    #     offices[k.to_sym][index]['official_photoUrl'] = official['photoUrl']
    #     offices[k.to_sym][index]['official_channels'] = official['channels']
    #   end
    # end
    @nationalOffices = offices[:nationalOffices]
    @stateOffices = offices[:stateOffices]
    @localOffices = offices[:localOffices]
    # fixed = Hash[@politicians.first.map do |row|
    #   row['officialIndices'] = row.fetch('officialIndices').map { |n| @politicians[1][n]}
    #   row
    # end]
    #
    # render json: [fixed]
  end

  def show
  end
  
  def local
  end

  def state
  end

  def national
  end

  def collectPoliticians
    # if user_signed_in?
    #   addy = current_user.address
    #   address = URI.encode(params[addy])
    # else
      address = URI.encode(params[:address])
    # end
    response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?address=#{address}&key=#{CI.key}")
    parsed_data = JSON.parse(response.body)
    @offices = parsed_data['offices']
    @officials = parsed_data['officials']

    return [@offices, @officials]
  end



end
