# frozen_string_literal: true
Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  mount Flipper::UI.app(Rails.application.config.flipper) => '/flipper'
  devise_for :users, controllers: { registrations: 'users/registrations'}
  ActiveAdmin.routes(self)

  authenticated :user do
    resources :subscriptions, only: [:new, :create]
    root to: 'home#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
end
