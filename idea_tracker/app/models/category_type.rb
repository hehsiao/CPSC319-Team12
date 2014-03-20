class Category_type < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :categories
end
