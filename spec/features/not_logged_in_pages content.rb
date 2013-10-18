require 'spec_helper'

  feature "Sign-in" do



    scenario "Front page(not signed-in) finding the sign-in form" do

      visit '/'
      expect(page).to have_content 'Sign in'
      find_by_id('user_email').should_not == nil
      find_by_id('user_password').should_not == nil

    end


    scenario "Front page(not signed-in) checking unavailability of 'Products' link" do

      visit '/'
      expect(page).to have_content 'Sign in'
      find_link('Products').click
      expect(page).to have_content 'Sign in'  

    end


    scenario "Sing-up page should have appropriative form" do

      visit '/'
      find_link('Sign up').click
      find_by_id('user_password_confirmation').should_not == nil

    end

    scenario "Forgot you password page should have specific submit button value" do

      visit '/'
      find_link('Forgot your password?').click
      expect(page).to have_selector('input',"Send me reset password instructions")

    end

  end