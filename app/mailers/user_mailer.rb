class UserMailer < ApplicationMailer
  default from: 'aucraig88@gmail.com' #for all messages in this class

  def welcome_email(email, subject, body)
    @name = email.name
    @email = email.email
    @body = body

    mail(to: email.email, subject: subject) #actual email message
  end
end
