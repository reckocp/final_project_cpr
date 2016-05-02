class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all
  end

  def show
    @politician = get_politician
  end

  def new
    @politician = Politician.new
  end

  def create
    @politician = Politician.new(politician_params)
    respond_to do |format|
      if @politician.save
        format.html { redirect_to @politician, notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    get_politician
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Politician was successfully updated.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to politicians_url, notice: 'Politician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_politician
    @politician = Politician.find(params[:politician_id])
  end

  def politician_params
    params.require(:politician).permit(:name, :party, :description, :served_area, :next_election, :location_id)
  end
end
