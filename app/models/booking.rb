class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :pickup_on, presence: true, uniqueness: true
  validates :return_on, presence: true, uniqueness: true
  validate :date_of_return_before_pickup

  def date_of_return_before_pickup
    errors.add(:return_on, 'cannot return in the past') if pickup_on > return_on
  end

  def past_pickup?
  end
end
