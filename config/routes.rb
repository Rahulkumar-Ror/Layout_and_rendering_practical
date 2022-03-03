Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # resources :users
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/edit'
  # get 'orders/new'
  # get 'products/index'
  # get 'products/show'
  # get 'products/new'
  # get 'products/edit'
  root to: "homes#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products do 
      resources :orders, shallow: true
    end
  end
  resources :products

  # Defines the root path route ("/")
  # root "articles#index"

end
