class AccommodationreviewPolicy < ApplicationPolicy
    attr_reader :user, :accommodationreview
  
    def initialize(user, accommodationreview)
      @user = user
      @accommodationreview = accommodationreview
    end

    def index?
      # @user.id == Role.find(3)
    end

    def show?
      # @accommodationreview.stay.guest.id == @user.id
    end

    def create?
      @accommodationreview.stay.guest.id == @user.id
    end

end