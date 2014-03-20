class IdeaTag < ActiveRecord::Base
	belongs_to :category
	belongs_to :idea
end
