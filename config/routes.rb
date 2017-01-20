Rails.application.routes.draw do
  root 'v1/status#index'
  namespace :v1 do
    resources :status, only: [:index]
  end
  # post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
