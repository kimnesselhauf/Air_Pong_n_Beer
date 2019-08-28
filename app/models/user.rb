class User < ApplicationRecord
  DEFAULT_PHOTO = "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpng.pngtree.com%2Fsvg%2F20161027%2Fservice_default_avatar_182956.png&f=1"

  mount_uploader :photo, PhotoUploader

  has_many :listings, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def photo_or_default
    photo.present? ? photo : DEFAULT_PHOTO
  end
end
