FactoryGirl.define do
  factory :product do
  title "a title"
  type "Trance"
  price "99.00"
  # image fixture_file_upload('public/test.png', 'image/png')
  # audio fixture_file_upload('public/demo_track.mp3', 'audio/mp3')
end
end