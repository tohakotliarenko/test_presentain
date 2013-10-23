require 'spec_helper'

describe "Product presence of fields" do
  
    before (:each) do
    	extend ActionDispatch::TestProcess
	end


	it "should check if all fields are present" do		
		# Product.create!(title: "Titletitle", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
		FactoryGirl.create(:product)
      	Product.all.count.should == 1
	end

	it "should check if Title is not present" do
		Product.create(title: "", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end

	it "should check if Type is not present" do
		Product.create(title: "Titletitle", type: "", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end

	it "should check if Price is not present" do
		Product.create(title: "Titletitle", type: "Trance", price: "", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end

	it "should check if Image is not present" do
		Product.create(title: "Titletitle", type: "Trance", price: "99.00", image: "", audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end

	it "should check if Audio is not present" do
		Product.create(title: "Titletitle", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: "")
      	Product.all.count.should == 0
	end

end

describe "Title length validation" do
	before (:each) do
    	extend ActionDispatch::TestProcess
	end

	it "title less than 4 char, product should not be created" do
		Product.create(title: "Til", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end	

	it "title is over than 100 char, product should not be created" do
		Product.create(title: "Tilsasdfasdfsadfasdfsadfsadfasdfsadfasdfasdfasdfasdfasdfasdfasdfasdfasdgfdhdfghdjshdfljhfoiuwehriouwhflyhsfoqweuhflasdfljdhsfoqiuwefhlasdfhoiuwefhrlasfdhoiuwefhlasdfhoqiuwefhlasdfhoiuwehflyjhfoqiuwehfalsdjhf", type: "Trance", price: "99.00", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end	
end

describe "Price validation" do
	before (:each) do
    	extend ActionDispatch::TestProcess
	end

	it "Price format isn't numerical" do
		Product.create(title: "Tilsf", type: "Trance", price: "alamab", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end	

	it "Price format isn't integer" do
		Product.create(title: "Tilsf", type: "Trance", price: "0.000567", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end	
end

describe "Audio validations" do
	before (:each) do
    	extend ActionDispatch::TestProcess
	end

	it "Attachment size is larger than 20mb" do
		Product.create(title: "Tilsf", type: "Trance", price: "alamab", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track(over20mb).mp3', 'audio/mp3'))
      	Product.all.count.should == 0
	end	

	it "Attachment format audio/mpeg" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mpeg', 'audio/mpeg'))
      	Product.all.count.should == 1
	end	

	it "Attachment format audio/x-mpeg" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.x-mpeg', 'audio/x-mpeg'))
      	Product.all.count.should == 1
	end	

	it "Attachment format audio/mp3" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mp3', 'audio/mp3'))
      	Product.all.count.should == 1
	end	

	it "Attachment format audio/x-mp3" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.x-mp3', 'audio/x-mp3'))
      	Product.all.count.should == 1
	end

	it "Attachment format audio/mpeg3" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mpeg3', 'audio/mpeg3'))
      	Product.all.count.should == 1
	end

	it "Attachment format audio/x-mpeg3" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.x-mpeg3', 'audio/x-mpeg3'))
      	Product.all.count.should == 1
	end

	it "Attachment format audio/mpg" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.mpg', 'audio/mpg'))
      	Product.all.count.should == 1
	end

	it "Attachment format audio/x-mpg" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.x-mpg', 'audio/x-mpg'))
      	Product.all.count.should == 1
	end

	it "Attachment format audio/x-mpegaudio" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.x-mpegaudio', 'audio/x-mpegaudio'))
      	Product.all.count.should == 1
	end

	it "Attachment format is not valid" do
		Product.create(title: "Tilsf", type: "Trance", price: "99", image: fixture_file_upload('public/test.png', 'image/png'), audio: fixture_file_upload('public/demo_track.wav', 'audio/wav'))
      	Product.all.count.should == 0
	end
end