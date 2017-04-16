# frozen_string_literal: true
module FeatureHelpers
  FAKE_CC = {
    number:   '4242424242424242',
    exp_date: '01/30',
    cvc:      '123'
  }.freeze

  def devise_sign_in(user)
    visit '/users/sign_in'
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
    end
    click_button 'Sign in'
  end
end
