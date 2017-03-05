# frozen_string_literal: true
Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  devise_for :users
  ActiveAdmin.routes(self)

  authenticated :user do
    resources :subscriptions, only: [:new, :create]
    root to: 'home#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
