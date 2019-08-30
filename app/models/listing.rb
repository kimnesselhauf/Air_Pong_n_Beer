class Listing < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  scope :never_booked, -> { left_joins(:bookings).where('bookings.listing_id IS NULL') }
  scope :available_on_dates, ->(dates) { left_joins(:bookings).where('(? > bookings.pickup_on) OR (? < bookings.pickup_on)', dates.first, dates.last).or(never_booked) }

  def booked_dates
    bookings.select('pickup_on AS from', 'return_on AS to') #JS query to select date ranges
  end

  def available_in_range?(pickup_on, return_on)
    bookings = self.bookings
    binding.pry
    self.bookings.where("pickup_on >= ? AND return_on <= ?", pickup_on, return_on)
    bookings.present?
  end
end
