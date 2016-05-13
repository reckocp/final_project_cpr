class PoliticiansController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :index]
  def index
    if user_signed_in?
      @user = current_user
      @posts = User.where(:state => current_user.state).joins(:posts).order("posts.created_at DESC").flat_map { |x| x.posts }
      @events = User.near(current_user).joins(:events).flat_map { |x| x.events }
      @politicians = collectPoliticians
    else
      @posts = Post.near(params[:address])
      @politicians = collectPoliticians
      @events = Event.near(params[:address])
    end
  end

  def show
  end

  def local
    @events = User.near(current_user).joins(:events).where("events.level = 'local'").flat_map { |x| x.events }
    @user = current_user
    @posts = User.near(current_user).joins(:posts).where("posts.level = 'local'").order("posts.created_at DESC").flat_map { |x| x.posts }
    @politicians = collectPoliticians
    @localOffices = []
    @offices.each do |office|
      if office.has_key? "levels"
      else
        @localOffices << office
      end
    end
  end

  def state
    @events = User.where(:state => current_user.state).joins(:events).where("events.level = 'state'").flat_map { |x| x.events }
    @user = current_user
    @posts = User.where(:state => current_user.state).joins(:posts).where("posts.level = 'state'").order("posts.created_at DESC").flat_map { |x| x.posts }
    @politicians = collectPoliticians
    @stateOffices = []
    @offices.each do |k, v|
      k.fetch("levels", []).each do |level|
        puts level
        if level == "administrativeArea1"
          @stateOffices << k
        end
      end
    end
  end

  def national
    @events = User.where(:state => current_user.state).joins(:events).where("events.level = 'national'").flat_map { |x| x.events }
    @user = current_user
    @posts = User.where(:state => current_user.state).joins(:posts).where("posts.level = 'national'").order("posts.created_at DESC").flat_map { |x| x.posts }
    @politicians = collectPoliticians
    @nationalOffices = []
    @offices.each do |k, v|
      k.fetch("levels", []).each do |level|
        puts level
        if level == "country"
          @nationalOffices << k
        end
      end
    end
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
    @offices = parsed_data.fetch('offices', [])
    @officials = parsed_data['officials']
    @offices.each do |eli1|
      eli1["officials"] = eli1["officialIndices"].map { |idx|
        @officials[idx]
      }
      eli1.delete("officialIndices")
    end
    return [@offices, @officials]
  end
end
