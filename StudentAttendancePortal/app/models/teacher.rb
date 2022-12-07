class Teacher < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/,
    message: "must have at least one uppercase letter, one lowercase letter, one number and one special character" } ,length: { minimum: 8 }
  validates :password, confirmation: true
  validates :mobile_no, length: { is: 10 }

  after_save :send_mail

  def send_mail
    puts "########################################################"
    TeacherMailer.with(teacher: self).welcome_email.deliver_now
  end
  
end
