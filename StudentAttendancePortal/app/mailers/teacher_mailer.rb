class TeacherMailer < ApplicationMailer
  default from: 'julee.gunjal@joshsoftware.com'

  def welcome_email
    puts "INNNNN mailer"
    puts params
    @teacher = params[:teacher]
    # @url  = 'http://gmail.com/login'
    mail(to: @teacher.email, subject: 'You are successfully registered on Student Attendance portal')
  end
end
