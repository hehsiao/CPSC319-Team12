class Idea < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) {controller && controller.current_user}
	
	belongs_to :partner
	belongs_to :owner, :class_name => 'User' # this is the current owner of the idea
	belongs_to :user, :class_name => 'User' # this is the creator of the idea
	belongs_to :status
	has_many :comments
	has_many :child_ideas, :class_name => 'Association', :foreign_key => 'parent_idea_id'
	has_many :parent_ideas, :class_name => 'Association', :foreign_key => 'tagged_idea_id'
	has_many :participants, :class_name => 'Subscription', :foreign_key => 'idea_id'

	validates_presence_of :summary
	validates_presence_of :description
	validates_presence_of :owner

	acts_as_taggable
	acts_as_taggable_on :keyword 

	# lets to comment on ideas
	acts_as_commontable

	def parent_ideas_ids
		self.parent_ideas.where(:is_hierarchy => 1).collect {|u| u.parent_idea_id}
	end
	def child_ideas_ids
		self.child_ideas.where(:is_hierarchy => 1).collect {|u| u.tagged_idea_id}
	end
	def peer_ideas_ids
		self.child_ideas.where(:is_hierarchy => 0).collect {|u| u.tagged_idea_id}
	end


	# scope :recent, order("created_at desc").limit(5)
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
	
	accepts_nested_attributes_for :partner
end