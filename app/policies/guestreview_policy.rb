class GuestreviewPolicy < ApplicationPolicy
    attr_reader :user, :guestreview
  
    def initialize(user, guestreview)
      @guestreview = guestreview
      @user = user
    end

    def index?
      # @user.id == Role.find(3)
    end

    def show?
      # @guestreview.stay.accommodation.host.id == @user.id
    end

    def create?
      @guestreview.stay.accommodation.host.id == @user.id
    end

end