Rails.application.routes.draw do
  resources :attachements
  devise_for :users
  root to: 'attachements#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
