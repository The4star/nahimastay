class Stay < ApplicationRecord
  belongs_to :accommodation
  belongs_to :guest, :class_name => 'User'
  has_many :messages
  has_one :accommodationreview
  has_one :guestreview

  def clear_state
    self.confirmed = false
    self.rejected = false
    self.cancelled = false
  end

  def set_state_pending
    self.clear_state
  end

  def set_state_confirmed
    self.clear_state
    self.confirmed = true
  end

  def set_state_rejected
    self.clear_state
    self.rejected = true
  end

  def set_state_cancelled
    self.clear_state
    self.cancelled = true
  end

  def state_pending?
    (!self.confirmed and !self.rejected and !self.cancelled)
  end

  def state_confirmed?
    self.confirmed
  end

  def state_rejected?
    self.rejected
  end

  def state_cancelled?
    self.cancelled
  end
end
