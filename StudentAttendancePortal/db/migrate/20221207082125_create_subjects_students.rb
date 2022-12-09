class CreateSubjectsStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects_students do |t|
      t.belongs_to :students
      t.belongs_to :subjects
      t.timestamps
    end
  end
end
