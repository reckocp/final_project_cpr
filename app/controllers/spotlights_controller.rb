class SpotlightsController < ApplicationController
  def index
    @spotlights = Spotlight.all
  end

  def show
    @spotlight = get_spotlight
  end

  def new
    @spotlight = Spotlight.new
  end

  def create
    @spotlight = Spotlight.new(spotlight_params)
    respond_to do |format|
      if @spotlight.save
        format.html { redirect_to root_path, notice: 'Spotlight was successfully created.' }
        format.json { render :show, status: :created, location: @spotlight }
      else
        format.html { render :new }
        format.json { render json: @spotlight.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    get_spotlight
    respond_to do |format|
      if @spotlight.update(spotlight_params)
        format.html { redirect_to @spotlight, notice: 'Spotlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @spotlight }
      else
        format.html { render :edit }
        format.json { render json: @spotlight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spotlight.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Spotlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_spotlight
    @spotlight = Spotlight.find(params[:id])
  end

  def spotlight_params
    params.require(:spotlight).permit(:title, :description, :date, :url, :user_id)
  end
end
