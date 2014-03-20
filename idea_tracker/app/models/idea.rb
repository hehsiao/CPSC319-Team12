class Idea < ActiveRecord::Base
	belongs_to :partner
	belongs_to :user
	has_many :comments

	acts_as_taggable
	acts_as_taggable_on :keyword 

	scope :recent, order("submission_date desc").limit(5)
	scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"]) }
	accepts_nested_attributes_for :partner
end
