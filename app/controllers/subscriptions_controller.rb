class SubscriptionsController < ApplicationController
  # bring in the `render_payola_status` helper.
  include Payola::StatusBehavior

  def new
    @plans = SubscriptionPlan.all
  end

  def create
    owner = current_user
    params[:plan] = SubscriptionPlan.find_by(id: params[:plan_id])
    subscription = Payola::CreateSubscription.call(params, owner)

    # Render the status json that Payola's javascript expects
    render_payola_status(subscription)
  end
end
