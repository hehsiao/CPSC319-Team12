class Idea < ActiveRecord::Base
	belongs_to :client
	belongs_to :user
	has_many :categories
	has_many :comments

		scope :sorted, lambda { order("subjects.position ASC") }
  	scope :newest_first, lambda { order("subjects.created_at DESC")}
  	scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"])
  	}
end
