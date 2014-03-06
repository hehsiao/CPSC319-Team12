class Idea < ActiveRecord::Base
	belongs_to :partner
	belongs_to :user
	has_many :comments

	scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"]) }
end
