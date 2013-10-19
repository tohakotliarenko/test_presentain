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
      Product.create!(title: "Skidf", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      Product.all.count.should == 1
    end
  end

  it 'should not create a product. validation should fall' do
  	Product.create(title: "Sk", type: "T", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
  	Product.all.count.should == 0
  end


  it 'shoud DELETE product' do
  	@product = Product.create!(title: "Skidf", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
  	@product.destroy
  	Product.all.count.should == 0
  end


  it 'SHOW action' do
  	@product = Product.create!(title: "Skidf", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
  	get :show, id: @product.id
    response.should render_template :show
  end  

  it 'should UPDATE the product' do
		@product = Product.create!(title: "Skidf", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
    @attr = { :title => "new title", :type => "Upated", :price => "19.00" }
    put :update, :id => @product.id, :product => @attr
    @product.reload
    @product.title.should == @attr[:title]
  end

end