class Accommodation < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :accomtype
  has_many :stays
  has_one_attached :hero_image
  has_one_attached :interior_image
  geocoded_by :city
  after_validation :geocode, :if => :city_changed?

  def update_accommodation_rating(communication_rating, ammenities_rating, location_rating, cleanliness_rating)

    # calculate total reviews by counting stay reviews
    accom_review_count = 0

    self.stays.each do |stay|
      if stay.accommodationreview
        accom_review_count =  accom_review_count + 1
      end
    end

    # Get average of this user's ratings
    users_average_rating = (communication_rating.to_i + ammenities_rating.to_i + location_rating.to_i + cleanliness_rating.to_i) / 5.0

    # add new rating to current accommodation rating
    self.accommodation_rating = self.accommodation_rating + users_average_rating
    # divide rating by total stays
    average_rating = self.accommodation_rating / accom_review_count
    self.save!
  end

  def get_accommodation_rating()
    # calculate total reviews by counting stay reviews
    # calculate total reviews by counting stay reviews
    accom_review_count = 0

    self.stays.each do |stay|
      if stay.accommodationreview
        accom_review_count =  accom_review_count + 1
      end
    end

    # divide rating by total stays
    average_rating = self.accommodation_rating / accom_review_count
    return average_rating
  end
end