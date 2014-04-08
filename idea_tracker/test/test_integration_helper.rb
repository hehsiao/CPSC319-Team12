require "test_helper"
require "capybara/rails"

    module ActionDispatch
      class IntegrationTest
        include Capybara

        def sign_in_as(user, password)
           user = User.create(:password => password, :password_confirmation => password, :email => user)
           user.confirmed_at = Time.now 
           user.save!
           visit '/'
           click_link_or_button('Log in')
           fill_in 'Email', :with => user.email
           fill_in 'Password', :with => password
           click_link_or_button('Sign in')
           user      
         end 
         def sign_out
            click_link_or_button('Log Out')   
         end
      end
    end