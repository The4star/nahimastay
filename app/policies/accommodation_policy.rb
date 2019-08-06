class AccommodationPolicy < ApplicationPolicy
  attr_reader :user, :accommodation

  def initialize(user, accommodation)
    @user = user
    @accommodation = accommodation
  end

  # def index?
  #   false
  # end

  def show?
    @accommodation.host.id == @user.id
  end

  def create?
    @accommodation.host.id == @user.id
  end

  # def new?
  #   false
  # end

  def update?
    @accommodation.host.id == @user.id
  end

  # def edit?
  #   update?
  # end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
