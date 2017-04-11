# frozen_string_literal: true
Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  devise_for :users, controllers: { registrations: 'users/registrations'}
  ActiveAdmin.routes(self)

  constraints CanAccessFlipperUI do
    mount Flipper::UI.app(Rails.application.config.flipper) => '/flipper'
  end

  authenticated :user do
    get '/subscription', to: 'subscriptions#edit'
    root to: 'home#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
end
