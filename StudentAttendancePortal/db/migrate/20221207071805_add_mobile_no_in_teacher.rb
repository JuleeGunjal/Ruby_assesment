class AddMobileNoInTeacher < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :mobile_no, :string
  end
end
