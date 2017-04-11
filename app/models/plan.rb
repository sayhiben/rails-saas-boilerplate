# frozen_string_literal: true
class Plan < ApplicationRecord
  has_paper_trail
  include Payola::Plan

  has_many :subscriptions, class_name: Payola::Subscription, inverse_of: :plan, foreign_key: :plan_id

  scope :visible, -> {
    where.not(hidden: true).order(amount: 'ASC')
  }

  def formatted_amount(currency: 'USD')
    Money.new(amount, currency).format
  end

  # Payola requires that the redirect_path after creating/updating a subscription is defined here
  # Do not replicate this pattern; this definition belongs in a helper method, NOT the model
  def redirect_path(_subscription)
    Rails.application.routes.url_helpers.subscription_path
  end
end
