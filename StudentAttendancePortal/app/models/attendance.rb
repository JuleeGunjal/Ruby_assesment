class Attendance < ApplicationRecord
  belongs_to :student, optional: true 
  belongs_to :subject, optional: true
end
