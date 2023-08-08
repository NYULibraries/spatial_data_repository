# frozen_string_literal: true

FactoryBot.define do
  factory :search do
    query_params { { q: 'test' } }
  end
end
