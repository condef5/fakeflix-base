class SeriePolicy < ApplicationPolicy
  attr_reader :user, :serie

  def initialize(user, serie)
    @user = user
    @serie = serie
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
