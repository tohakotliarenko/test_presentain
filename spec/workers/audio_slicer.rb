require 'spec_helper'

describe "AudioSlicer worker" do

  it 'should add job to worker' do

    product = FactoryGirl.create(:product)

	work = AudioSlicer.new
	expect {
  		AudioSlicer.perform_async(product.id)
	}.to change(AudioSlicer.jobs, :size).by(1)

  end

 #  it "should delete demo_track.mp3" do

 #  	audio = File.new(Rails.root + 'public/demo_track.mp3')
 #  	File.should be_exist(audio)

 #  	product = FactoryGirl.create(:product)
 #  	AudioSlicer.perform_async(product.id)

	# File.should_not be_exist(audio)  	

 #  end

  it 'should check if the audio filesize was changed' do
  	
  	include Sidekiq::Worker
  	include Sidekiq::Status::Worker

  	initial_file_size = File.size(Rails.root + 'public/demo_track.mp3').to_f
  	product = FactoryGirl.create(:product)
  	job_id = AudioSlicer.perform_async(product.id)
  	if Sidekiq::Status::complete? job_id
	  	final_file_size = File.size(product.audio.path).to_f
	  	final_file_size.should < initial_file_size
  	end

  end

end