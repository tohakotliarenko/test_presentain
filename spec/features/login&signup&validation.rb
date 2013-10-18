require 'spec_helper'

  feature "Sign-in" do


    scenario "Create a user and sign him in" do

      FactoryGirl.create(:user)
      visit '/'
      within(:xpath, '//form') do
        fill_in 'Email', :with => 'example@example.com'
        fill_in 'Password', :with => '12345678'
        click_button('Sign in')
      end
      expect(page).to have_selector('a','New')

    end

    scenario "Validation test. Trying login a non-existing user" do

      visit '/'
      within(:xpath, '//form') do
        fill_in 'Email', :with => 'nonexisting@user.com'
        fill_in 'Password', :with => 'imrealllynotexist'
        click_button('Sign in')
      end
      expect(page).to have_content('Sign in')

    end


    scenario "Test sign-up form and login" do

      visit '/'
      find_link('Sign up').click
      within(:xpath, '//form') do
        fill_in 'Email', :with => 'example@example.com'
        fill_in 'Password', :with => '12345678'
        fill_in 'Password confirmation', :with => '12345678'
        click_button('Sign up')
      end
      expect(page).to have_content('a','New')

    end

    scenario "Validation test. Trying sign-in with a non-valid user info" do

      visit '/'
      find_link('Sign up').click
      within(:xpath, '//form') do
        fill_in 'Email', :with => 'e@e.c'
        fill_in 'Password', :with => '1'
        fill_in 'Password confirmation', :with => '1'
        click_button('Sign up')
      end
      expect(page).to have_content('Sign up')

    end

  end