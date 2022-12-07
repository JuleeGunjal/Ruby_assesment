class Student < ApplicationRecord
  has_many :subjects_students
  has_many :subjects, through: :subjects_students
end
