class RenameTeachersIdFromSubject < ActiveRecord::Migration[7.0]
  def change
    change_table :subjects do |t|
      t.rename :teachers_id, :teacher_id
    end
  end
end
