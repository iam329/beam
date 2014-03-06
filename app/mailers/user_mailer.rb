class UserMailer < ActionMailer::Base
  default from: "hi@stereotonic.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    mail to: user.email, subject: "Welcome to Stereotonic"
  end

  # "user" is the user following the "follower"
  def follower(follower, target)
  	@target = target
  	@follower = follower 
  	mail to: @target.email, subject: "#{@follower.name} started following you on Stereotonic"
  end
end
