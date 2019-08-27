class User < ApplicationRecord
  DEFAULT_PHOTO = "https://kitt.lewagon.com/placeholder/users/ssaunier"

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
