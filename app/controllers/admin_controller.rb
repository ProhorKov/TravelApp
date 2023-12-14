class AdminController < ApplicationController
  def index
    @tours = Tour.all
    authorize Tour, policy_class: AdminPolicy
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end
end
