class Stay < ApplicationRecord
  belongs_to :accommodation
  belongs_to :user as :guest
end
