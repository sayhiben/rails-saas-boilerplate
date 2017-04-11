# frozen_string_literal: true

module SubscriptionsHelper
  def plan_button(plan)
    if plan == current_user.active_plan
      update_payment_button(current_user.active_subscription)
    elsif current_user.active_subscription
      change_plan_button(current_user.active_subscription, plan)
    else
      subscribe_button(plan)
    end
  end

  def subscribe_button(plan)
    options = {
      plan:         plan,
      button_class: 'btn btn-lg btn-block',
      button_text:  'Choose Plan',
      email:        current_user.email
    }
    stripe_customer_id = current_user.stripe_customer_id
    options[:stripe_customer_id] = stripe_customer_id if stripe_customer_id

    render('payola/subscriptions/checkout', options)
  end

  def change_plan_button(subscription, plan)
    render('subscriptions/change_plan',
           subscription: subscription,
           new_plan:     plan,
           button_class: 'btn btn-lg btn-block',
           button_text:  'Change Plan',
           email:        current_user.email)
  end

  def update_payment_button(subscription)
    render('subscriptions/update_card',
           panel_label:        'Update Card',
           label:              'Update Card',
           button_class:       'btn btn-lg btn-block',
           button_text:        'Update Card',
           subscription:       subscription,
           email:              current_user.email,
           stripe_customer_id: subscription.stripe_customer_id)
  end
end
