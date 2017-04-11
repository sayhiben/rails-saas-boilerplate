# frozen_string_literal: true
class SubscriptionsController < ApplicationController
  # bring in the `render_payola_status` helper.
  include Payola::StatusBehavior

  layout 'account'

  def edit
    @plans = Plan.visible.to_a

    # If the user is subscribed to an invisible plan (maybe they were grandfathered in or the plan is a one-off), then
    # prepend the current plan so that the user can still see its details and update payment methods
    return unless current_user.active_subscription.present? && !@plans.include?(current_user.active_subscription.plan)
    @plans.unshift(current_user.active_subscription.plan)
  end
end
