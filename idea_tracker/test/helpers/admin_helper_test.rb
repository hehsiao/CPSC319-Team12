require 'test_helper'

class AdminHelperTest < ActionView::TestCase
	setup do
    @user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
  end

end