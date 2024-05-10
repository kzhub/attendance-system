class User < ApplicationRecord
  has_many :attendances

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # def self.last_attendance_endtime_is_nil?(user_id)
  #   user = User.find_by(id: user_id)
  #   last_attendance = user.attendances.order(created_at: :desc).first
  #   if last_attendance && last_attendance.attendance_endtime.nil?
  #     [true, last_attendance.id]
  #   else
  #     [false,000]#magic numberは修正すること
  #   end
  # end

  # def self.last_attendance_breaktime_is_nil?(user_id)
  #   user = User.find_by(id: user_id)
  #   last_attendance = user.attendances.order(created_at: :desc).first
  #   if last_attendance && last_attendance.breaktime_starttime.nil?
  #     false
  #   else
  #     true
  #   end
  # end
end
