class AddBreaktimeToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :breaktime_starttime, :datetime
    add_column :attendances, :breaktime_endtime, :datetime
  end
end
