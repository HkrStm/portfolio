class User < ApplicationRecord
  has_many :rooms, dependent: :restrict_with_error
  has_many :reservations, dependent: :restrict_with_error
  has_many :reserve_rooms, through: :reservations, source: :room

	validates :username, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_icon, UserIconUploader
end
