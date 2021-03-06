class Profile < ApplicationRecord
  belongs_to :user
  validates :bio, length: { maximum: 200 }
  has_one_attached :uploaded_image

  def update_host_rating(rating)
    # calculate total reviews by counting stay reviews
    host_review_count = 0

    self.user.accommodation.stays.each do |stay|
      if stay.accommodationreview
        host_review_count =  host_review_count + 1
      end
    end

    # add new rating to current rating
    self.host_rating = self.host_rating + rating.to_i
    self.save!
  end

  def get_host_rating()
    # calculate total reviews by counting stay reviews
    host_review_count = 0
    
    if self.user.accommodation
      self.user.accommodation.stays.each do |stay|
        if stay.accommodationreview
          host_review_count =  host_review_count + 1
        end
      end
      
      # divide rating by total stays
      if host_review_count != 0
        average_rating = self.host_rating / host_review_count
      else
        average_rating = 0
      end

    end

    return average_rating
  end


  def update_guest_rating(cleanliness_rating, communication_rating, ease_of_hosting_rating)

    guest_stays = Stay.where(guest_id: self.user.id)
 
    # calculate total reviews by counting stay reviews
    guest_review_count = 0

    guest_stays.each do |stay|
      if stay.guestreview
        guest_review_count =  guest_review_count + 1
      end
    end

    # Get average of this user's ratings
    users_average_rating = calculate_average([cleanliness_rating.to_i, communication_rating.to_i, ease_of_hosting_rating.to_i])

    # add new rating to current guest rating
    self.guest_rating = self.guest_rating + users_average_rating
    self.save!
  end

  def get_guest_rating()
    guest_stays = Stay.where(guest_id: self.user.id)

    # calculate total reviews by counting stay reviews
    guest_review_count = 0

    guest_stays.each do |stay|
      if stay.guestreview
        guest_review_count =  guest_review_count + 1
      end
    end

    # divide rating by total stays
    if guest_review_count != 0
      average_rating = self.guest_rating / guest_review_count
    else 
      average_rating = 0
    end
    return average_rating
  end
end
