class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.date :attendance_date
      t.time :attendance_starttime
      t.time :attendance_endtime

      t.timestamps
    end
  end
end
