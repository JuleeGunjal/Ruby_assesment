class TeacherMailer < ApplicationMailer
  def welcome_email
    @teacher = params[:teacher]
    mail(to: @teacher.email, subject: I18n.t("mailer.teacher.welcome.subject"))
  end
end
