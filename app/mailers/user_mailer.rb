class UserMailer < ApplicationMailer

  default from: "pokjett@gmail.com"

  def welcome_email(user)

    @user = user
    @url = 'http://monsite.fr'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_participant_email(user)

    @user = user
    @url = 'http://monsite.fr'
    mail(to: @user.email, subject: 'Un nouveau participant a ton évènement !')
  end


def reset_passsword_instruction(user)

    @user = user
    @url = 'http://monsite.fr'
    mail(to: @user.email, subject: 'Reset')
  end
end
