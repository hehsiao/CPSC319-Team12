require "test_helper"

class ExampleTest < ActionDispatch::IntegrationTest

  def test_login
    # get the login page
    get "/users/sign_in"
    assert_equal 200, status

    @user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
    follow_redirect!
    assert_equal 200, status
    assert_equal "/dashboard", path
  end
end