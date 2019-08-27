class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :pickup_on, presence: true, uniqueness: true
  validates :return_on, presence: true, uniqueness: true
  validate :date_of_pickup_in_past
  validate :date_of_return_before_pickup

  def date_of_return_before_pickup
    errors.add(:return_on, 'date before pick up date') if pickup_on > return_on
  end

  def date_of_pickup_in_past
    errors.add(:pickup_on, 'date in the past') if pickup_on < Date.today
  end
end
