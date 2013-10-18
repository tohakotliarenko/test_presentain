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


    # background do
      # User.make(:email => 'user@example.com', :password => 'caplin')

    # end

    # scenario "Signing in with correct credentials" do
    #   visit '/sessions/new'
    #   within("#session") do
    #     fill_in 'Login', :with => 'user@example.com'
    #     fill_in 'Password', :with => 'caplin'
    #   end
    #   click_link 'Sign in'
    #   expect(page).to have_content 'Success'
    # end

    # given(:other_user) { User.make(:email => 'other@example.com', :password => 'rous') }

    # scenario "Signing in as another user" do
    #   visit '/sessions/new'
    #   within("#session") do
    #     fill_in 'Login', :with => other_user.email
    #     fill_in 'Password', :with => other_user.password
    #   end
    #   click_link 'Sign in'
    #   expect(page).to have_content 'Invalid email or password'
    # end


  end






  # include Devise::TestHelpers

  # before (:each) do
  #   @user = FactoryGirl.create(:user)
  #   sign_in @user
  # end



  # describe "GET 'index'" do
  #   it "should be successful" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end

  # describe "CREATE action" do
  #   it "should create new product and show it" do

    # image = File.new(Rails.root + 'public/test.png')


	# #@image = fixture_file_upload('public/assets/rails-a3386665c05a2d82f711a4aaa72d247c.png', 'image/jpg')      
	# audio = fixture_file_upload('public/demo_track.mp3','')

    # post :create, :product => { title: "Ski", type: "Trance", price: "99.00", image: image }
    # Product.all.count.should == 1

 	# post :create, :product => { title: "Ski", type: "Trance", price: "99.00" }
#  	FactoryGirl.create(:product)
#     Product.all.count.should == 1

#     end
#   end

#   it 'should not create a product. validation should fall' do

#   	Product.create(title: "Sk", type: "T", price: "99.00")

#   	Product.all.count.should == 0

#   end


#   it 'shoud DELETE product' do

#   	@product = Product.create!(title: "Skidf", type: "Trance", price: "99.00")

#   	@product.destroy

#   	Product.all.count.should == 0
  	
#   end


#   it 'SHOW action' do

#   	@product = Product.create!(title: "Skiff", type: "Trance", price: "99.00")
#   	puts @product
#   	# response.should redirect_to :action => "show"
#   	get :show, id: @product.id
#     response.should render_template :show

#   end  

# it 'should UPDATE the product' do

# 	# @product = Product.create!(title: "Skiff", type: "Trance", price: "99.00")

# 	  		@product = FactoryGirl.create(:product)

# 		    @attr = { :title => "new title", :type => "Upated", :price => "19.00" }

# 		    put :update, :id => @product.id, :product => @attr
# 		    # response.should be_successful

# 		    @product.reload
# 		    @product.title.should == @attr[:title]



# end

# end