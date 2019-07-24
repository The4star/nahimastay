class Stay < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user as :guest
  has_many :messages
  has_one :accommodationreview
  has_one :guestreview
end
