# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Subscription Management' do
  let!(:user) { create(:user) }
  let!(:plan) { create(:monthly_plan, name: 'Test Plan', stripe_id: 'pln1') }
  let!(:other_plan) { create(:monthly_plan, name: 'Other Plan', stripe_id: 'pln2') }

  describe 'subscribing to a new plan', js: true do
    context 'when never subscribed before' do
      it 'allows the user to subscribe' do
        devise_sign_in(user)
        visit 'subscription'

        # Click to subscribe
        within "#payola-button-plan-#{plan.id}-form" do
          click_button 'Choose Plan'
        end

        # Wait for the iframe
        expect(page).to have_selector('.stripe_checkout_app')

        within_frame 'stripe_checkout_app' do
          # Sometimes there's an MFA modal, and we need to click "back"
          if page.has_selector?('span.Header-navBack')
            click_on('span.Header-navBack')
          end

          # Wait for frame to load
          expect(page).to have_field('Card number')

          # Fill out form
          find_field('Card number').send_keys(FeatureHelpers::FAKE_CC[:number])
          find_field('MM / YY').send_keys("01#{DateTime.current.year + 1}")
          find_field('CVC').send_keys('123')

          # Submit form
          find('button[type="submit"]').click
        end

        # There should be an "Update Card" button on the page, indicating there's an active subscription
        expect(page).to have_content('Update Card')
      end
    end

    context 'when already subscribed'
    context 'when previously subscribed'
  end

  describe 'canceling a subscription' do
    context 'when subscribed to an active plan'
  end
end
