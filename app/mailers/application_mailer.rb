class ApplicationMailer < ActionMailer::Base
  default from: "iamironmantstark@gmail.com"
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
