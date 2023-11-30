# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index
    if user_signed_in?
      redirect_to tours_path
    else
      redirect_to new_user_registration_path
    end
  end

  def profile
    @current_user = current_user
    @tours = current_user.tours
  end
end
