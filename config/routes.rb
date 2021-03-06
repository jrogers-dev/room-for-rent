Rails.application.routes.draw do
  get '/users/dashboard' => 'users#dashboard', as: :user_root # creates user_root_path
  get '/users/my_properties' => 'users#my_properties'
  get '/users/magnate' => 'users#magnate'

  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :users do
    resources :messages
  end

  resources :properties
  resources :home, only: :index

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
