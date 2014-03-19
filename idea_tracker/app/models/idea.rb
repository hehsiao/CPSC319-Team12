class Idea < ActiveRecord::Base
	belongs_to :partner
	belongs_to :user
	has_many :comments

	acts_as_taggable
	acts_as_taggable_on :keyword 

	scope :recent, order("created_at desc").limit(5)
	scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"]) }
end
