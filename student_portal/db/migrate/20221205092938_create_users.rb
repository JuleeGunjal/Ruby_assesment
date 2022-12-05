class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :email
      t.string :password
      t.string :name
      t.date :dob
      t.string :phone
      t.string :address
      t.string :gender

      t.timestamps
    end
  end
end
