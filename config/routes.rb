Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'home#index'
end
