class SubscriptionPlan < ApplicationRecord
  include Payola::Plan

  def formatted_amount(currency: 'USD')
    Money.new(amount, currency).format
  end
end
