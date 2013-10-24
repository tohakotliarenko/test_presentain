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

end

# require "spec_helper"

# describe "audio slicer" do
  
#   	it "should slice given product async"
# 		product = FactoryGirl.create(:product)

# 		work = AudioSlicer.new
# 		expect {
# 	  		AudioSlicer.perform_async(@product.id)
# 		}.to change(AudioSlicer.jobs, :size).by(1)

	# should change(work.jobs, :size).by(1)
	# work.should have_enqueued_job("AudioSlicer", true)
		

  # it { should be_processed_in :audio_slicer }
  # it { should be_retryable false }
  # it { should be_unique }

  # it "enqueues another audio slicing" do
  #   AudioSlicer.perform_async(@product.id.to_s)

  #   expect(AudioSlicer).to have_enqueued_job("AudioSlicer", true)
#   	end
# end