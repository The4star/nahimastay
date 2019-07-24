class Accommodation < ApplicationRecord
  belongs_to :host, :class_name => 'User'
  belongs_to :accomtype
  has_many :stays
end
