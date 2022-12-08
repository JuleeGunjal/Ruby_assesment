class Teacher < ApplicationRecord
  validates :email, presence: { message: I18n.t("blank") }, uniqueness: { message: I18n.t("unique") }, format: { with: EMAIL_REGEX, message: I18n.t("invalid")}
  validates :password, format: { with: PASSWORD_REGEX, message: I18n.t("pattern") }
  validates :password, confirmation: true
  validates :mobile_no, uniqueness: true, format: { with: MOBILE_NO_REGEX, message: I18n.t("invalid")}

  after_save :send_welcome_mail

  def send_welcome_mail
    TeacherMailer.with(teacher: self).welcome_email.deliver_now
  end

end
