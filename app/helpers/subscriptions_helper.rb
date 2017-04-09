module SubscriptionsHelper
  def plan_button(plan)
    render('payola/subscriptions/checkout',
           plan:         plan,
           button_class: 'btn btn-lg btn-block',
           button_text:  'Choose Plan',
           email:        current_user.email)
  end
end
