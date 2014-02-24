class Client < ActiveRecord::Base
	has_many :ideas

	scope :sorted, lambda { order("subjects.position ASC") }
  	scope :newest_first, lambda { order("subjects.created_at DESC")}
  	scope :search, lambda {|query|
    	where(["name LIKE ?", "%#{query}%"])
  	}
end
