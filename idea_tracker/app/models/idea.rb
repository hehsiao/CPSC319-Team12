class Idea < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) {controller && controller.current_user}
	
	belongs_to :partner
	belongs_to :user
	has_many :comments
	has_many :child_ideas, :class_name => 'Association', :foreign_key => 'parent_idea_id'
	has_many :parent_ideas, :class_name => 'Association', :foreign_key => 'tagged_idea_id'
	has_many :participants, :class_name => 'Subscription', :foreign_key => 'idea_id'

	acts_as_taggable
	acts_as_taggable_on :keyword 

	# lets to comment on ideas
	acts_as_commontable

	# scope :recent, order("created_at desc").limit(5)
	scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
	
	accepts_nested_attributes_for :partner

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |idea|
				csv << idea.attributes.values_at(*column_names)
			end
		end
		
	end
end