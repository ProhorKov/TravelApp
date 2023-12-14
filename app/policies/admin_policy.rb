class AdminPolicy < ApplicationPolicy
  attr_reader :user, :tour

  def initialize(user, tour)
    @user = user
    @tour = tour
  end

  def index?
    @user.present? && @user.admin?
  end
end
