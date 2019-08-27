class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :pickup, uniqueness: true
  validates :return, uniqueness: true
end
