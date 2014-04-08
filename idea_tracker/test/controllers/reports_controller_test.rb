require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
