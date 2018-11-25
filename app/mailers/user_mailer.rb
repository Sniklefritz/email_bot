class UserMailer < ApplicationMailer
  default from: 'emailaddress@example.com' #for all messages in this class

  def welcome_email
    @user = params[:user]
    @url = ''
    mail(to: @user.email, subject: 'Welcome') #actual email message
  end
end
