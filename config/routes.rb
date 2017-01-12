# frozen_string_literal: true
Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  devise_for :users
  ActiveAdmin.routes(self)
  resources :subscriptions
  root to: 'home#index'
end
