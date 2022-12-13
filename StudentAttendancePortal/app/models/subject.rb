class Subject < ApplicationRecord
  belongs_to :teacher, optional: true
  has_many :attendance, dependent: :nullify
  has_many :subjects_students
  has_many :students, through: :subjects_students
end
