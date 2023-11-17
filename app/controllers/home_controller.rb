# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    if user_signed_in?
      redirect_to edit_user_registration_path
    else
      redirect_to new_user_registration_path
    end
  end
end
