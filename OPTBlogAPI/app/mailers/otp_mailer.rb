class OtpMailer < ApplicationMailer
  append_view_path(OTP::PATH)
   def otp(email, otp, user, mail_opts = {})
    @user = user
    @otp = otp
    mail(to: email, subject: I18n.t("mailer.otp.subject"))
  end
end
