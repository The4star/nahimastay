class Accommodation < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :accomtype
  has_many :stays
  has_one_attached :hero_image
  has_one_attached :interior_image
end