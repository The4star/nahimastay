class StayPolicy < ApplicationPolicy
    attr_reader :stay, :user
    def initialize(user, stay)
        @user = user
        @stay = stay
    end

    def index?
        @user.id == @stay.accommodation.host.id or @user.id == @stay.guest.id
    end
    
    def show?
        @user.id == @stay.accommodation.host.id or @user.id == @stay.guest.id
    end

    def edit?
        @user.id == @stay.guest.id
    end

    def update_status
        @user.id == @stay.accommodation.host.id or @user.id == @stay.guest.id
    end
end