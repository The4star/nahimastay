class Accommodationreview < ApplicationRecord
  belongs_to :stay
  validates :communication_rating, :location_rating, :cleanliness_rating, :ammenities_rating, :host_rating, presence: true, numericality: { less_than_or_equal_to: 5,  only_integer: true }
end
