class RentalPolicy < ApplicationPolicy
  attr_reader :user, :rental

  def initialize(user, rental)
    @user = user
    @rental = rental
  end

  def index?
    user.admin? || user.regular?
  end

  def show?
    user.admin? || user.regular?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end 
