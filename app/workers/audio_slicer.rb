require 'rcomet/client'
class AudioSlicer
	include Sidekiq::Worker

	@queue = :audio_slicer

	def perform(product_id)
		puts "Find Products"
		product = Product.find(product_id)
    puts "Find Track"
    %x[ffmpeg -t 60 -acodec copy -i #{product.audio.path} demo_track.mp3]
    product.update_audio!
    File.delete("#{Rails.root}/demo_track.mp3")
    puts "Finish!"
	end

end