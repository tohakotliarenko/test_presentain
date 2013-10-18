require 'spec_helper'

describe ProductsController do

  include Devise::TestHelpers

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end



  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "CREATE action" do
    it "should create new product and show it" do

    # image = File.new(Rails.root + 'public/test.png')


	# #@image = fixture_file_upload('public/assets/rails-a3386665c05a2d82f711a4aaa72d247c.png', 'image/jpg')      
	# audio = fixture_file_upload('public/demo_track.mp3','')

    # post :create, :product => { title: "Ski", type: "Trance", price: "99.00", image: image }
    # Product.all.count.should == 1

 	# post :create, :product => { title: "Ski", type: "Trance", price: "99.00" }
 	FactoryGirl.create(:product)
    Product.all.count.should == 1

    end
  end

  it 'should not create a product. validation should fall' do

  	Product.create(title: "Sk", type: "T", price: "99.00")

  	Product.all.count.should == 0

  end


  it 'shoud DELETE product' do

  	@product = Product.create!(title: "Skidf", type: "Trance", price: "99.00")

  	@product.destroy

  	Product.all.count.should == 0
  	
  end


  it 'SHOW action' do

  	@product = Product.create!(title: "Skiff", type: "Trance", price: "99.00")
  	puts @product
  	# response.should redirect_to :action => "show"
  	get :show, id: @product.id
    response.should render_template :show

  end  

it 'should UPDATE the product' do

	# @product = Product.create!(title: "Skiff", type: "Trance", price: "99.00")

	  		@product = FactoryGirl.create(:product)

		    @attr = { :title => "new title", :type => "Upated", :price => "19.00" }

		    put :update, :id => @product.id, :product => @attr
		    # response.should be_successful

		    @product.reload
		    @product.title.should == @attr[:title]

end

end