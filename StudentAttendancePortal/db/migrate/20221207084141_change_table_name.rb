class ChangeTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :subjects_sudents, :subjects_students
  end
end
