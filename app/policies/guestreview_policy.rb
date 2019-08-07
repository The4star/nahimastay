class GuestreviewPolicy < ApplicationPolicy
    attr_reader :user, :guestreview
  
    def initialize(user, guestreview)
      @user = user
      @accommodationreview = guestreview
    end

    def index?
      @user.id == Role.find(3)
    end

    def show?
      @guestreview.stay.accommodation.host == @user.id
    end

    def create?
      @guestreview.stay.accommodation.host == @user.id
    end

end