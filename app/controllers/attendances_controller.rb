require 'holiday_japan'

class AttendancesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

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
      user_id: params[:user_id]
    )

    if @Attendance.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    @attendance = Attendance.find(params[:id])

    # if params[:attendance]&.dig(:operation) == 'start_break'
    #   @attendance.breaktime_starttime = Time.now
    # elsif params[:attendance]&.dig(:operation) == 'end_break'
    #   @attendance.breaktime_endtime = Time.now
    # elsif
    # end
    @attendance.attendance_endtime = Time.now

    if @attendance.save
        redirect_to root_path
    else
        redirect_to user_path
    end
end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless @user == current_user
    end

end
