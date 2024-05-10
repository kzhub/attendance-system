class Attendance < ApplicationRecord
  belongs_to :user
  before_create :check_today_data

  def self.getCalender(year,month)
    searchYear = getCurrentYearMonth(year,month)[0]
    searchMonth = getCurrentYearMonth(year,month)[1]

    start_date = Date.new(searchYear, searchMonth, 1)
    end_date = Date.new(searchYear, searchMonth, -1)

    days = (start_date..end_date)
  end

  def self.getHolidays(year, month)
    searchYear = getCurrentYearMonth(year,month)[0]
    searchMonth = getCurrentYearMonth(year,month)[1]

    start_date = Date.new(searchYear, searchMonth, 1)
    end_date = Date.new(searchYear, searchMonth, -1)

    HolidayJapan.between(start_date, end_date)
  end

  def check_today_data
    today_date = Date.today
    Attendance.exists?(user_id: self.user_id, attendance_date: today_date)
  end

  # def is_attendance?(user_id)
  #   user = User.find_by(id: user_id)
  #   last_attendance = user.attendances.order(created_at: :desc).first
  #   if last_attendance && last_attendance.attendance_endtime.nil?
  #     [true, last_attendance.id]
  #   else
  #     [false,000]#magic numberは修正すること
  #   end
  # end

  # def is_breaktime?(user_id)
  #   user = User.find_by(id: user_id)
  #   last_attendance = user.attendances.order(created_at: :desc).first
  #   if last_attendance && last_attendance.breaktime_starttime.nil?
  #     false
  #   else
  #     true
  #   end

  # end

  private
    def self.getCurrentYearMonth(year, month)
      today = Date.today

      if year.nil? || month.nil? || year < 2000 || year > 2050 || month < 1 || month > 12
          year = today.year
          month = today.month
      end

      [year, month]
    end


end
