class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :status
      t.string :month
      t.time :time
      t.belongs_to :subjects, index: true, foreign_key: true
      t.timestamps
    end   
  end
end
