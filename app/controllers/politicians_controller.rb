class PoliticiansController < ApplicationController
  before_filter :authenticate_user!, except: [:home]
  def index
    @politicians = collectPoliticians
    @user = current_user
    @posts = Post.all
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
    if user_signed_in?
      addy = current_user.address
      address = URI.encode(addy)
    else
      address = URI.encode(params[:address])
    end
    response = HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?address=#{address}&key=#{CI.key}")
    parsed_data = JSON.parse(response.body)
    @offices = parsed_data['offices']
    @officials = parsed_data['officials']

    return [@offices, @officials]
  end



end
