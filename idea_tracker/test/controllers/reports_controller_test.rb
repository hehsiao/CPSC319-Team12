require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @user = User.create(id: 2, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
  end

  test "should get charting" do
    get :charting
    assert_response :success
  end

  test "should get bar chart" do
    get :chart, chart_type:"bar", date_type:"day",aggregate1:"status_id",aggregate2:"user_id",date_tag:"created_at",date_value1:'2014-03-03',date_value2:'2014-04-09'
    assert_response :success
    assert_select "#container"
  end

  test "should get line chart" do
    get :chart, chart_type:"line", date_type:"month",aggregate3:"ideas",date_tag:"updated_at",date_value1:'2014-03-03',date_value2:'2014-04-09'
    assert_response :success
    assert_select "#container"
  end

  test "should get table chart" do
    get :chart, chart_type:"table", date_type:"year",aggregate1:"provider_partner_id",date_tag:"status_date_change",date_value1:'2014-03-03',date_value2:'2014-04-09'
    assert_response :success
    assert_select "#container"
  end

  test "should get pie chart" do
    get :chart, chart_type:"pie", date_type:"day",aggregate1:"provider_partner_id",date_tag:"created_at",date_value1:'2014-03-03',date_value2:'2014-04-09'
    assert_response :success
    assert_select "#container"
  end

    test "should show status_show" do
  get :status_show,id: 1
    assert_response :success
  end  

  test "should show popularity" do 
  get :popularity
  assert_response :success
  end
  
  test "should show popularity_show" do
  get :popularity_show,id: 1
  assert_response :success  
  end

   test "should show assigned_ideas" do 
  get :assigned_ideas
  assert_response :success
  end

    test "should show subscribed_ideas" do 
  get :subscribed_ideas
  assert_response :success
  end

    test "should show recent_ideas" do 
  get :recent_ideas
  assert_response :success


  end

end