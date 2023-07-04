Rails.application.routes.draw do
  devise_for :users, sign_out_via: :delete

  resources :games, only: [:index, :show]

  authenticated :user do
    resources :bookmarks, only: [:index, :create, :destroy]
  end

  root to: 'games#index'
end
