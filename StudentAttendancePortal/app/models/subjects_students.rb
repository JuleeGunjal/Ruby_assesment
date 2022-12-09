class SubjectsStudents < ApplicationRecord
  belongs_to :subjects
  belongs_to :students
end
