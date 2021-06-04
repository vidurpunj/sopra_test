Rails.application.routes.draw do
  get 'tv_series/index'
  devise_for :users
  root to: 'welcome#index'

  resources :users
  resources :tv_series
  post '/tv_seriel_comments', to: 'tv_series#tv_seriel_comments', as: :tv_seriel_comments
  post '/search_actor', to: 'tv_series#search_actor', as: :search_actor
end
