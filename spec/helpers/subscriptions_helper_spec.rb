# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SubscriptionsHelper, type: :helper do
  let(:user) { build(:user) }
  let(:plan) { create(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }
  let(:other_plan) { create(:monthly_plan, name: 'Other Plan', stripe_id: 'pln2') }
  let(:subscription) { build(:subscription, plan: plan, owner: user) }

  describe '#plan_button', :vcr do
    before do
      allow(helper).to receive(:current_user) { user }
    end

    context 'with an active subscription' do
      before do
        allow(user).to receive(:active_plan) { plan }
        allow(user).to receive(:active_subscription) { subscription }
      end

      it 'renders the Update Payment button when the plan is the same as the current user\'s active plan' do
        expect(helper.plan_button(plan)).to match(/_update_payment_button/)
      end

      it 'renders the Change Plan button when the plan is different than the current user\'s active plan' do
        expect(helper.plan_button(other_plan)).to match(/_change_plan_button/)
      end
    end

    context 'with no subscription' do
      before do
        allow(user).to receive(:active_plan) { nil }
        allow(user).to receive(:active_subscription) { nil }
      end

      # This is fragile because we can't let it actually call render due to a rails-controller-tests gem incompatibility
      it 'renders the Choose Plan button' do
        options = {
          plan:         plan,
          button_class: 'btn btn-lg btn-block _subscribe_button',
          button_text:  'Choose Plan',
          email:        user.email
        }

        expect(helper).to receive(:render).with('payola/subscriptions/checkout', options)
        helper.plan_button(plan)
      end

      # This is fragile because we can't let it actually call render due to a rails-controller-tests gem incompatibility
      it 'renders the a Stripe customer id data attribute when the user already has a subscription' do
        allow(user).to receive(:subscriptions) { [build(:subscription, plan: other_plan, stripe_customer_id: 'cus1')] }

        options = {
          plan:         plan,
          button_class: 'btn btn-lg btn-block _subscribe_button',
          button_text:  'Choose Plan',
          email:        user.email,
          stripe_customer_id: 'cus1'
        }

        expect(helper).to receive(:render).with('payola/subscriptions/checkout', options)
        helper.plan_button(plan)
      end
    end
  end
end
