class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :pickup, presence: true, uniqueness: true
  validates :return, presence: true, uniqueness: true
end
