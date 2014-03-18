class UserMailer < ActionMailer::Base
  default from: "cpsc3192014@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://localhost:3000/'
  	mail(to: user.email, subject: 'welcome to the Ideal Tracker')
    #flash[:notice] = "sended successfully"
  end

end
