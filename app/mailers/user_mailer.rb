class UserMailer < ApplicationMailer
  default from: 'notifications@rankme.com'

  def recovery_email(user)
    @user = user
    mail(to: @user.email, subject: 'Forgotten password?')
  end
end
