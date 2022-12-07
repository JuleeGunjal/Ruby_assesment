class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :sname
      t.string :scode
      
      t.timestamps
    end
    add_reference :subjects, :teachers, foreign_key: true
  end
end
