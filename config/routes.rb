Rails.application.routes.draw do
  resources :games, only: [:index, :show]
  devise_for :users

  authenticated :user do
    resources :bookmarks, only: [:index, :create, :destroy]
  end

  root to: 'games#index'
end
