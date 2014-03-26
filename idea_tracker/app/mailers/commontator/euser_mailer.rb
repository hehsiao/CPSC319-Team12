class EuserMailer < ActionMailer::Base
  default from: "cpsc3192014@gmail.com"

    def comment_email(thread, user, comment_context)
    @user = user
    @thread = thread
    @idea = Idea.where(idea_id: thread.commontable_id)
    @comment = comment_context
    @related_users = Subscription.where(idea_id: thread.commontable_id)
    @all_email = []

    @related_users.each do |related_user|
    if User.find_by_id(related_user.user_id)      
    @all_email << User.find_by_id(related_user.user_id).email  
    end 
    end

    if @all_email.present?
    mail(to: @all_email, subject: 'Someone post a comment on Ideal Tracker')
    end
  end

end
