# frozen_string_literal: true
FactoryGirl.define do
  factory :plan do
    amount 100

    factory :monthly_plan do
      interval 'month'
    end
  end
end
