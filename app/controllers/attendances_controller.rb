require 'holiday_japan'

class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.where(user_id: params[:user_id])

    year = params[:year].to_i
    month = params[:month].to_i

    @holidays = Attendance.getHolidays(year, month)
    @days = Attendance.getCalender(year, month)
  end

  def new
    @isAttendance = User.last_attendance_endtime_is_nil?(params[:user_id])
    @user = User.find(params[:user_id])
    @attendance = @user.attendances.new
  end

  def create
    @Attendance = Attendance.new(
      attendance_date: Date.today,
      attendance_starttime: Time.now,
      attendance_endtime: nil,
      user_id: params[:user_id]#url構造からuseridを取得
    )

    if @Attendance.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.attendance_endtime = Time.now

    if @attendance.save
      redirect_to root_path
    else
      redirect_to user_path
    end
  end

end
