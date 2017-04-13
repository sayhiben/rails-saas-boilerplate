# frozen_string_literal: true
FactoryGirl.define do
  factory :subscription, class: Payola::Subscription do
    guid 'abc123'
    email 'subscription_email@example.com'
    currency 'usd'
  end
end
