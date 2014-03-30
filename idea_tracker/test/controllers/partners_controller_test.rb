require 'test_helper'

class PartnersControllerTest < ActionController::TestCase
  setup do
    @user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
    sign_in @user
    @partner = partners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partner" do
    assert_difference('Partner.count') do
      post :create, partner: { contact_name: @partner.contact_name, email: @partner.email, partner_name: @partner.partner_name, phone_num: @partner.phone_num, secondary_email: @partner.secondary_email, secondary_contact_name: @partner.secondary_contact_name, secondary_phone_num: @partner.secondary_phone_num  }
    end

    assert_redirected_to partner_path(assigns(:partner))
  end

  test "should show partner" do
    get :show, id: @partner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner
    assert_response :success
  end

  test "should update partner" do
    patch :update, id: @partner, partner: { contact_name: @partner.contact_name, email: @partner.email, partner_name: @partner.partner_name, phone_num: @partner.phone_num, secondary_email: @partner.secondary_email, secondary_contact_name: @partner.secondary_contact_name, secondary_phone_num: @partner.secondary_phone_num }
    assert_redirected_to partner_path(assigns(:partner))
  end

  test "should destroy partner" do
    assert_difference('Partner.count', -1) do
      delete :destroy, id: @partner
    end

    assert_redirected_to partners_path
  end
end
