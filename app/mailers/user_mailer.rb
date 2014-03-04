class UserMailer < ActionMailer::Base
  default from: "vinnie329@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    mail to: user.email, subject: "Welcome to Stereotonic"
  end
end
