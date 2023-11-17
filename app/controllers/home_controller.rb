# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    if user_signed_in?
      redirect_to edit_user_registration_path
    else
      # Страница, отображаемая для незалогиненных пользователей
    end
  end

  def dashboard
    # Содержимое страницы для залогиненных пользователей
  end
end
