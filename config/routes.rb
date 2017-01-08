Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'home#index'
end
