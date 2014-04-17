class UserMailer < ActionMailer::Base
  default from: "cpsc3192014@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://it.henrychsiao.com/'
  	mail(to: user.email, subject: 'Welcome to Idea Tracker')
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
    mail(to: @all_email, subject: @user.first_name + ' has updated ' + @idea.summary +  ' on Idea Tracker')
    end
    #flash[:notice] = "sended successfully"
  end

  def idea_email(idea, email, user)
    @user = user
    @email = email
    @idea = idea
    @related_users = Subscription.where(idea_id: idea.id)
    @related_users.each do |related_user| 
    end

    if @email.present?
    mail(to: @email, subject: @user.first_name + ' thinks you might be interested in this project!')
    end
    #flash[:notice] = "sended successfully"
  end

  def comment_email(thread, user, comment_context)
    @user = user
    @thread = thread
    @idea = Idea.find_by_id(@thread.commontable_id)
    @comment = comment_context
    @related_users = Subscription.where(idea_id: @thread.commontable_id)
    @all_email = []

    @related_users.each do |related_user|
      if User.find_by_id(related_user.user_id)      
        @all_email << User.find_by_id(related_user.user_id).email  
      end 
    end

    if @all_email.present?
      mail(to: @all_email, subject: @user.first_name + ' has posted a comment on Idea Tracker')
    end
  end
end
