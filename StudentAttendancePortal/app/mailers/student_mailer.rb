class StudentMailer < ApplicationMailer
  def welcome_email
    @student = params[:student]
    mail(to: @student.email, subject: I18n.t("mailer.student.welcome.subject"))
  end
end
