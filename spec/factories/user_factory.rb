# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example_#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
