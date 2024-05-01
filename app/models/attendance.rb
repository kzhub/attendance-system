class Attendance < ApplicationRecord
  belongs_to :user

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
