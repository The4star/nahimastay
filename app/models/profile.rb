class Profile < ApplicationRecord
  belongs_to :user
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
    # divide rating by total stays
    average_rating = self.host_rating / host_review_count
    self.save!
  end

  def get_host_rating()
    # calculate total reviews by counting stay reviews
    host_review_count = 0

    self.user.accommodation.stays.each do |stay|
      if stay.accommodationreview
        host_review_count =  host_review_count + 1
      end
    end
    # divide rating by total stays
    average_rating = self.host_rating / host_review_count
    return average_rating
  end

end
