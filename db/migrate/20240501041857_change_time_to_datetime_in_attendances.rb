# class ChangeTimeToDatetimeInAttendances < ActiveRecord::Migration[6.1]
#   def change
#     change_column :attendances, :attendance_starttime, :datetime
#     change_column :attendances, :attendance_endtime, :datetime
#   end
# end

class ChangeTimeToDatetimeInAttendances < ActiveRecord::Migration[6.1]
  def change
    change_column :attendances, :attendance_starttime, :datetime, using: "'2024-01-01'::date + attendance_starttime::interval"
    change_column :attendances, :attendance_endtime, :datetime, using: "'2024-01-01'::date + attendance_endtime::interval"
  end
end
