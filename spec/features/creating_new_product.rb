require 'spec_helper'

  feature "Create a new product" do
    background do
      @user = FactoryGirl.create(:user)
      visit '/'
      within(:xpath, '//form') do
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => @user.password
        click_button('Sign in')
      end
    end

    scenario "Creating a new product" do
      create_product
    end

    scenario "Creation of new product should not pass because of validation" do
      visit '/'
      find_link('New').click
      within(:xpath, '//form') do
        select('Trance', :from => 'product_type')
        fill_in 'Title', :with => 'Th'
        fill_in 'Price', :with => '99.00'
        attach_file('Image', 'public/test.png')
        click_button('Create Product')
      end
      expect(page).to have_selector('a','Cancel')
    end

    scenario "Show action should show product page with back button" do
      create_product
      click_link('Thisisproduct')
      expect(page).to have_selector('a','Back')      
    end    

    scenario "Test update action" do
      create_product
      click_link('Edit')
      expect(page).to have_selector('a','Cancel')
      within(:xpath, '//form') do
        fill_in 'Title', :with => 'Thitlechanged!'
        click_button('Update Product')
      end
      expect(page).to have_content('Thitlechanged!')

    end

    # scenario "Destroy product" do
      # create_product
      # click_link('Destroy')
    # end


    def create_product
      visit '/'
      find_link('New').click
      within(:xpath, '//form') do
        select('Trance', :from => 'product_type')
        fill_in 'Title', :with => 'Thisisproduct'
        fill_in 'Price', :with => '99.00'
        attach_file('Image', 'public/test.png')
        click_button('Create Product')
      end
      expect(page).to have_selector('a','New')
    end
  end