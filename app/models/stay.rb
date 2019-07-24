class Stay < ApplicationRecord
  belongs_to :accommodation
  belongs_to :guest, :class_name => 'User'
  has_many :messages
  has_one :accommodationreview
  has_one :guestreview
end
