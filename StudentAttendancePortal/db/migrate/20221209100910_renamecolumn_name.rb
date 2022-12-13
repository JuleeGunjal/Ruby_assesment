class RenamecolumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :attendances do |t|
      t.rename :students_id, :student_id
      t.rename :subjects_id, :subject_id
    end
  end
end
