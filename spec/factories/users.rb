FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "OOOOOOOO" }
    sequence(:email) { |n| "email-#{srand}@nyu.edu" }
  end
end
