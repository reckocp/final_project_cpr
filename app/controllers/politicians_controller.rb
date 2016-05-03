class PoliticiansController < ApplicationController
  def index
    @politicians = collectPoliticians
  end

  def addressCheck
    if params[:address].blank?
      redirect_to root_path, alert: "Please enter an address!"
    end
  end

  def collectPoliticians
    address = URI.encode(params[:address])
    HTTParty.get("https://www.googleapis.com/civicinfo/v2/representatives?address=#{address}&key=#{CI.key}")
  end


end
