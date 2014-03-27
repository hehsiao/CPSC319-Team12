class Category < ActiveRecord::Base
	belongs_to :type, :class_name => 'CategoryType'
	belongs_to :parent, :class_name => 'Category'
	has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
	has_many :tag, :class_name => 'IdeaTag', :foreign_key => 'category_id'

	def to_s
		self.category_name
	end

	def self.get_children_by_parent_name parent_name
		parent = Category.find_by :category_name => parent_name
		if !parent.nil?
			parent.children
		else
			nil
		end
	end

	scope :top_categories, lambda { where(parent_id: 0)}
end
