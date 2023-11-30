class ToursUsersController < ApplicationController
  before_action :authenticate_user!

  def buy
    tour = Tour.find params[:id]
    unless current_user.tours.where(id: params[:id]).any?
      current_user.tours << tour
    end
    redirect_to tour
  end

  def cancel
    tour = Tour.find params[:id]
    if current_user.tours.where(id: params[:id]).any?
      current_user.tours.delete tour.id
    end
    redirect_to tour
  end
end
