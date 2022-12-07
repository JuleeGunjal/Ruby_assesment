class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :dob
      t.string :gender
      t.text :address
      t.string :semister
      t.string :course
      
      t.timestamps
    end
  end
end
