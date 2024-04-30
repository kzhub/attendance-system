require 'holiday_japan'

class AttendancesController < ApplicationController

  def index
    # ?year=2024&month=5 param example
    year = params[:year] ? params[:year].to_i : Date.today.year
    month = params[:month] ? params[:month].to_i : Date.today.month


    start_date = Date.new(year, month, 1)
    end_date = Date.new(year, month, -1)

    @holidays = getHolidays(year, month)
    @days = (start_date..end_date)
  end

  private
    def getHolidays(year, month)
      if year.nil? || month.nil? || year < 2000 || year > 2050 || month < 1 || month > 12
          today = Date.today
          year = today.year
          month = today.month
      end

      start_date = Date.new(year, month, 1)
      end_date = Date.new(year, month, -1)

      HolidayJapan.between(start_date, end_date)
    end

end
