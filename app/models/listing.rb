class Listing < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def booked_dates
    bookings.select('pickup_on AS from', 'return_on AS to') #JS query to select date ranges
  end
end
