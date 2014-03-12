class UserMailer < ActionMailer::Base
  default from: "hi@stereotonic.co"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    mail to: user.email, subject: "Welcome to Stereotonic!"
  end

  # "user" is the user following the "follower"
  def follower(follower, target)
  	@target = target
  	@follower = follower 
  	mail to: @target.email, subject: "#{@follower.name} started following you on Stereotonic!"
  end

  # post belongs to the user
  # liker likes the post that belongs to the user
  def liker(liker, post, user)
    @liker = liker
    @post = post
    @user = user
    mail to: @user.email, subject: "#{@liker.name} liked your track on Stereotonic!"
  end
  
end
