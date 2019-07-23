class Accommodation < ApplicationRecord
  belongs_to :user as :host
  belongs_to :accomtype
  has_many :stays
end
