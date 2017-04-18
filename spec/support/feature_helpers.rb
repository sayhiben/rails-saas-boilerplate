# frozen_string_literal: true
module FeatureHelpers
  FAKE_CC = {
    number:   '4242424242424242',
    exp_date: '01/30',
    cvc:      '123'
  }.freeze

  def devise_sign_in(user)
    visit '/users/sign_in'

    # Wait
    expect(page).to have_selector('#new_user')

    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
    end
    click_button 'Sign in'

    # Wait
    expect(page).to have_content('Signed in')
  end

  def subscribe_to_plan(plan)
    visit 'subscription'

    within ".plan[data-plan-id='#{plan.id}']" do
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
      expect(page).to have_selector('button[type="submit"]')
      find('button[type="submit"]').click
    end

    # Wait for the page to load and show the update payment button for the plan, indicating success
    expect(page).to have_selector(".plan[data-plan-id='#{plan.id}'] ._update_payment_button")
  end

  def cancel_subscription
    visit 'subscription'

    # Click the cancel button
    within 'form[action^="/payola/cancel_subscription/"]' do
      click_button 'Cancel Subscription'
    end

    # Confirm dialog
    page.driver.browser.accept_js_confirms

    # Wait
    expect(page).not_to have_selector('.plan ._change_plan_button, .plan ._update_payment_button')
  end
end
