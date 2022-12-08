class Teacher < ApplicationRecord
  validates :email, presence: { message: I18n.t("blank") }, uniqueness: { message: I18n.t("unique") }, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})/, message: I18n.t("invalid")}
  validates :password, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/,
    message: I18n.t("pattern") }
  validates :password, confirmation: true
  validates :mobile_no, length: { is: 13, message: I18n.t("wrong_length") }, uniqueness: true, format: { with: /(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?/, message: I18n.t("invalid")}

  after_save :send_welcome_mail

  def send_welcome_mail
    TeacherMailer.with(teacher: self).welcome_email.deliver_now
  end

end
