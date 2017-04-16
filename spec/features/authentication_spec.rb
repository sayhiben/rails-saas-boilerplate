# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'AuthenticationProcess' do
  let!(:user) { create(:user) }

  describe 'signing up' do
    context 'with new credentials' do
      it 'creates a new account' do
        email    = 'new_user@example.com'
        password = 'password'

        visit 'users/sign_up'
        within '#new_user' do
          fill_in 'user_email', with: email
          fill_in 'user_password', with: password
          fill_in 'user_password_confirmation', with: password
        end
        click_button 'Sign up'
        expect(page).to have_content 'You have signed up'
      end
    end

    context 'with existing credentials' do
      it 'rejects the new account' do
        visit 'users/sign_up'
        within '#new_user' do
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
        end
        click_button 'Sign up'
        expect(page).to have_content 'Email has already been taken'
      end
    end
  end

  describe 'signing in' do
    context 'with an existing user' do
      it 'signs in existing users' do
        sign_in(user)
        expect(page).to have_content 'Signed in'
      end
    end

    context 'with incorrect credentials' do
      it 'rejects the login attempt' do
        visit 'users/sign_in'
        within '#new_user' do
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'incorrect password'
        end
        click_button 'Sign in'
        expect(page).to have_content 'Invalid Email or password'
      end
    end
  end

  describe 'signing out' do
    before do
      sign_in(user)
    end

    it 'should sign out the user' do
      visit '/'
      click_link 'Sign out'
      expect(page).to have_content 'Signed out successfully'
    end
  end
end
