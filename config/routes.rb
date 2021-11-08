Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contracts, except: :destroy do
    resources :commissions, only: %i[create]
    resources :terms, only: %i[new create]
  end
  resources :terms, only: %i[edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
