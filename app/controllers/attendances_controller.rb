require 'holiday_japan'
class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.where(user_id: 7)

    # ?year=2024&month=5 param example
    year = params[:year].to_i
    month = params[:month].to_i

    @holidays = Attendance.getHolidays(year, month)
    @days = Attendance.getCalender(year, month)
  end

  def new

  end

  def create

  end

end
