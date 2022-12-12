class Subject < ApplicationRecord
  belongs_to :teacher, dependent: :delete_all
  has_many :attendance
  has_many :subjects_students
  has_many :students, through: :subjects_students
end
