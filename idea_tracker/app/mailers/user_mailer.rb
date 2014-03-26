class UserMailer < ActionMailer::Base
  default from: "cpsc3192014@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://localhost:3000/'
  	mail(to: user.email, subject: 'welcome to the Ideal Tracker')
    #flash[:notice] = "sended successfully"
  end

  def edit_notification_email(idea, user)
    @user = user
    @idea = idea
    @related_users = Subscription.where(idea_id: idea.id)
    @all_email = []

    @related_users.each do |related_user|
    if User.find_by_id(related_user.user_id)      
    @all_email << User.find_by_id(related_user.user_id).email  
    end 
    end

    if @all_email.present?
    mail(to: @all_email, subject: 'Someone edit idea on Ideal Tracker')
    end
    #flash[:notice] = "sended successfully"
  end

  def idea_email(idea, email)
    @email = email
    @idea = idea
    @related_users = Subscription.where(idea_id: idea.id)
    @related_users.each do |related_user| 
    end

    if @email.present?
    mail(to: @email, subject: 'Idea for YOU!!!')
    end
    #flash[:notice] = "sended successfully"
  end

end
