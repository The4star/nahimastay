class Profile < ApplicationRecord
  belongs_to :user
  has_one :uploaded_image
end
