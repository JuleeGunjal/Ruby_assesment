class RenameSnameFromSubjectName < ActiveRecord::Migration[7.0]
  def change
    change_table :subjects do |t|
      t.rename :sname, :name
      t.rename :scode, :code
    end
    
  end
end
