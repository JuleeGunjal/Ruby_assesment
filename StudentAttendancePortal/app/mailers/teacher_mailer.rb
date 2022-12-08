class TeacherMailer < ApplicationMailer
  def welcome_email
    @teacher = params[:teacher]
    mail(to: @teacher.email, subject: default_i18n_subject)
  end
end
