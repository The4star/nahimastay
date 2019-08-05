class AccommodationReviewPolicy < ApplicationPolicy
    attr_reader :user, :accommodation
  
    def initialize(user, accommodationreview)
      @stay = accommodationreview
    end
end