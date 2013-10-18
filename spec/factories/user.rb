FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password '12345678'
    password_confirmation '12345678'
    remember_me true
     #required if the Devise Confirmable module is used
     #confirmed_at Time.now
  end
end