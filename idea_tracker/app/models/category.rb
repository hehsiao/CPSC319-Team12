class Category < ActiveRecord::Base
	belongs_to :type, :class_name => 'CategoryType'
	belongs_to :parent, :class_name => 'Category'
	has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
	has_many :tag, :class_name => 'IdeaTag', :foreign_key => 'category_id'
end
