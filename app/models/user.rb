class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :create_profile, :if => :new_record?
  # after_initialize :create_accommodation, :if => :new_record?
  has_many :stays
  has_one :profile
  has_one :accommodation

  def set_default_role
    self.role = Role.find(2)
  end

  def create_profile
    self.profile = Profile.new
  end

  # def create_accommodation
  #   self.accommodation = Accommodation.new
  # end

end
