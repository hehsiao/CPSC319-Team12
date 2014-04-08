require "test_integration_helper"

class UserTest < ActionDispatch::IntegrationTest

	setup do
		@idea = ideas(:one)
		@user = User.create(id: 1, email: "janeadminseed@ubc.ca", password: "12341234", first_name: "Jane", last_name: "Adminseed", admin: "1")
	end
	test 'test_login_create_edit_idea' do
		# get the login page
		visit root_path
		within('#user_signin') do
			fill_in 'user[email]', with: @user.email
			fill_in 'user[password]', with: @user.password
		end
		click_on 'Sign in'
		assert_equal "/dashboard", current_path
		# login successed!

		click_on 'Submit an Idea!'
		assert_equal "/ideas/new", current_path
		within('#new_idea') do
			fill_in 'idea[summary]', with: @idea.summary
			fill_in 'idea[description]', with: @idea.description
		end
		click_on 'Submit'

		assert_match /ideas\/[\d]+/, current_path
		assert page.has_content?(@idea.summary)
		assert page.has_content?(@idea.description)
		assert page.has_content?('New Submission')
		
		click_on 'Edit Idea'
		assert page.has_content?('Editing an Idea')
		page.select('Verified', from: 'idea[status_id]')
		click_on 'Submit'
		
		assert_match /ideas\/[\d]+/, current_path
		assert page.has_content?(@idea.summary)
		assert page.has_content?(@idea.description)
		assert page.has_content?('Verified')
		

	end
end