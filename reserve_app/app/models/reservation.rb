class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

	validates :number_reservations, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  validate :date_check

  def date_check
    errors.add(:check_in, '日付が不正です') if check_in.nil? || check_in < Date.today
    errors.add(:check_out, '日付が不正です') if check_out.nil? || check_out < Date.today
  end
end
