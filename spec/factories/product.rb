FactoryGirl.define do
  factory :product do
  title "a title"
  type "Trance"
  price "99.00"
  image File.new(Rails.root + 'public/test.png')
  audio File.new(Rails.root + 'public/demo_track.mp3')
end
end

# FactoryGirl.define do
#   factory :product do
#   title "a title"
#   type "Trance"
#   price "99.00"
#   image File.new(Rails.root + 'test.png')
#   audio File.new(Rails.root + 'demo_track.mp3')
# end
# end