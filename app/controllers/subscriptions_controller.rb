# frozen_string_literal: true
class SubscriptionsController < ApplicationController
  # bring in the `render_payola_status` helper.
  include Payola::StatusBehavior

  def new
    @plans = Plan.all
  end

  def create
    owner = current_user
    params[:plan] = Plan.find_by(id: params[:plan_id])
    subscription = Payola::CreateSubscription.call(params, owner)

    # Render the status json that Payola's javascript expects
    render_payola_status(subscription)
  end
end
