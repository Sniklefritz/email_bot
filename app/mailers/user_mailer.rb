class UserMailer < ApplicationMailer
  default from: 'christiancounselornearme@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = ''
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
