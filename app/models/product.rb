class Product
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  field :title, type: String
  field :type, type: Integer
  field :price, type: Integer

	# attr_accessible :title, :type, :price, :image, :audio
	attr_accessible :title, :type, :price

  TYPE_TRANCE = 1
  TYPE_UPLAIFTING = 2

  TYPE_PRODUCT = { 'Trance' => TYPE_TRANCE, 'Uplifting' =>  TYPE_UPLAIFTING }

	has_mongoid_attached_file :audio,
														url:  "/system/:rails_env/:attachment/:id/:style/:id.:extension",
														path: ":rails_root/public:url"

	has_mongoid_attached_file :image,
														url:  "/system/:rails_env/:attachment/:id/:style/:id.:extension",
														path: ":rails_root/public:url",
														styles: { 
																			small: ['80x80>', :jpg],
																			medium: ['140x150#', :jpg],
																			large: ['250x250>', :jpg]
																		}

  belongs_to :owner, class_name: "User"

  # validates_presence_of :title, :type, :price, :image, :audio
  validates_presence_of :title, :type, :price
  validates_length_of :title, within: 4..100
  validates :price, numericality: { only_integer: true }
	# validates_attachment_size :audio, less_than: 20.megabytes
	# validates_attachment_content_type :audio, content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]


	def update_audio!
		self.update_attributes(audio: File.open("#{Rails.root}/demo_track.mp3"))
		self.save
	end


end
