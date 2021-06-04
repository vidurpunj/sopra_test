Rails.application.routes.draw do
  get 'tv_series/index'
  devise_for :users
  root to: 'welcome#index'

  resources :users
  resources :tv_series
end
