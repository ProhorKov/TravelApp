class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index
    redirect_to tours_path
  end

  def profile
    @current_user = current_user
    @tours = current_user.tours
  end
end
