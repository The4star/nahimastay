class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  after_initialize :set_default_role, :if => :new_record?
  has_many :stays

  def set_default_role
  self.role = Role.find(2)
  end
end
