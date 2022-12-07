class AddStudentIdInAttendance < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :students, foreign_key: true
  end
end
