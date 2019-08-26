class Listing < ApplicationRecord
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
