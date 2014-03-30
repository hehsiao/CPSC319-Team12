require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  setup do
    @user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
    @idea = ideas(:one)
    @participant = subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea" do
    assert_difference('Idea.count') do
      post :create, idea: { summary: @idea.summary, description: @idea.description, last_modified: @idea.last_modified, provider_partner_id: @idea.provider_partner_id, receiver_partner_id: @idea.receiver_partner_id, status_date_change: @idea.status_date_change, created_at: @idea.created_at, updated_at: @idea.updated_at, user_id: @idea.user_id, status_id: @idea.status_id, owner_id: @idea.owner_id }
    end

    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should show idea" do
    get :show, id: @idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea
    assert_response :success
  end

  test "should update idea" do
    patch :update, id: @idea, idea: { description: @idea.description, last_modified: @idea.last_modified, provider_partner_id: @idea.provider_partner_id, receiver_partner_id: @idea.receiver_partner_id, status_date_change: @idea.status_date_change, submission_date: @idea.created_at, user_id: @idea.user_id }
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should destroy idea" do
    assert_difference('Idea.count', -1) do
      delete :destroy, id: @idea
    end

    assert_redirected_to ideas_path
  end

  # test "add participant" do
  #   assert_difference('Partipant.count') do
  #     post :handle_participations, participant: 
  #   end

  # end

end
