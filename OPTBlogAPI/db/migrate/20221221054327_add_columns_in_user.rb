class AddColumnsInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :country_code, :string
    change_column :users, :mobile_no, :integer
  end
end
