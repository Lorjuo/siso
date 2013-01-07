require 'faker'
require 'factory_girl'

#unless FactoryGirl.factories[:custom_user]
FactoryGirl.define do
  factory :user do |f|
  	f.username { Faker::Internet.user_name }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation { |u| u.password }
    
    factory :editor do
        after(:create) {|user| user.add_role(:editor)}
    end
    factory :admin do
        after(:create) {|user| user.add_role(:admin)}
    end
  end
end
#end