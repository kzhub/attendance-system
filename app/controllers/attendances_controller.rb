require 'holiday_japan'
class AttendancesController < ApplicationController

  def index
    # ?year=2024&month=5 param example
    year = params[:year].to_i
    month = params[:month].to_i

    @holidays = Attendance.getHolidays(year, month)
    @days = Attendance.getCalender(year, month)
  end
end
