# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Subscription Management', js: true do
  let!(:user) { create(:user) }
  let!(:plan) { create(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }
  let!(:other_plan) { create(:monthly_plan, name: 'Other Plan', stripe_id: 'pln2') }

  before do
    devise_sign_in(user)
  end

  describe 'subscribing to a new plan' do
    context 'when never subscribed before' do
      it 'allows the user to subscribe' do
        subscribe_to_plan(plan)

        visit 'subscription'

        expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._update_payment_button")
        expect(page).to have_selector(".plan[data-plan-id='#{other_plan.id}'] ._change_plan_button")
      end
    end

    context 'when already subscribed' do
      before do
        subscribe_to_plan(plan)
      end

      it 'allows the user to change plans' do
        visit 'subscription'

        # Click to change plans
        within ".plan[data-plan-id='#{other_plan.id}']" do
          click_button 'Change Plan'
        end

        expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._change_plan_button")
        expect(page).to have_selector(".plan[data-plan-id='#{other_plan.id}'] ._update_payment_button")
      end
    end

    context 'when previously subscribed' do
      before do
        subscribe_to_plan(plan)
        cancel_subscription
      end

      it 'allows the user to resubscribe instantly' do
        visit 'subscription'

        # Make sure the page shows us as unsubscribed
        expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._subscribe_button")
        expect(page).to have_selector(".plan[data-plan-id='#{other_plan.id}'] ._subscribe_button")

        # Choose a new plan now that we're canceled
        within ".plan[data-plan-id='#{plan.id}']" do
          click_button 'Choose Plan'
        end

        # Assert that we're subscribed to the plan
        expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._update_payment_button")
        expect(page).to have_selector(".plan[data-plan-id='#{other_plan.id}'] ._change_plan_button")
      end
    end
  end

  describe 'canceling a subscription' do
    context 'when subscribed to an active plan' do
      before do
        subscribe_to_plan(plan)
      end

      it 'unsubscribes the user' do
        cancel_subscription
        visit 'subscription'

        # Make sure the page shows us as unsubscribed
        expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._subscribe_button")
        expect(page).to have_selector(".plan[data-plan-id='#{other_plan.id}'] ._subscribe_button")
      end
    end
  end
end
