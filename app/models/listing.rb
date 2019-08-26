class Listing < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  validates :photo, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
