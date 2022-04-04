class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 20}}
    validates :start_day,:end_day,presence: true
    
    validate :start_end_check
    
    def start_end_check
        if start_day.present? and end_day.present?
            errors.add(:end_day, "は開始日より前の日付で登録できません。") unless
            self.start_day < self.end_day
        end
    end
end
