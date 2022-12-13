class Student < ApplicationRecord
  has_many :subjects_students
  has_many :subjects, through: :subjects_students
  has_one :attendance, dependent: :nullify

  validates :email, presence: { message: I18n.t("blank") }, uniqueness: { message: I18n.t("unique") }, format: { with: EMAIL_REGEX, message: I18n.t("invalid")}
  validates :password, format: { with: PASSWORD_REGEX, message: I18n.t("pattern") }
  validates :password, confirmation: true
  
  after_save :send_welcome_mail

  def send_welcome_mail
    StudentMailer.with(student: self).welcome_email.deliver_now
  end

end
