# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |_n| 'OOOOOOOO' }
    sequence(:email) { |_n| "email-#{srand}@nyu.edu" }
  end
end
