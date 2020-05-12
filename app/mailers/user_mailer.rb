class UserMailer < ApplicationMailer

  default from: "pokjett@gmail.com"

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
