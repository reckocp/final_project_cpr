class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def home
    current_user
  end
end
