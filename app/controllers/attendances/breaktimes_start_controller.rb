class Attendances::BreaktimesStartController < ApplicationController
  def create
    @attendance = Attendance.find(params[:attendance_id])

    @attendance.breaktime_starttime = Time.now

    if @attendance.save
        redirect_to root_path
    else
        redirect_to user_path
    end
  end
end
