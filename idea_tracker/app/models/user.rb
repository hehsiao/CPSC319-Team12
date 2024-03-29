class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :comments
  has_many :subscriptions

  # allows users to post comments
  acts_as_commontator

  after_create :register_mail
  def register_mail
  	UserMailer.welcome_email(self).deliver
  end
  def to_s
    self.first_name + " " + self.last_name
  end
  
end
