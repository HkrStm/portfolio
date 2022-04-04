class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :restrict_with_error
  has_many :user_reservations, through: :reservations, source: :user

	validates :room_name, :introduction, :address, :room_image, presence: true
	validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  mount_uploader :room_image, RoomImageUploader

  def self.search(search)
    if search
      Room.where(['room_name LIKE ?', "%#{search}%"]).or(Room.where(['address LIKE ?', "%#{search}%"]))
    else
      Room.all
    end
  end
end
