class TourPolicy < ApplicationPolicy
  attr_reader :user, :tour

  def initialize(user, tour)
    @user = user
    @tour = tour
  end

  def create?
    @user.present? && @user.admin?
  end

  def update?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end
end
