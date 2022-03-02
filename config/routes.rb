Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/edit'
  # get 'orders/new'
  # get 'products/index'
  # get 'products/show'
  # get 'products/new'
  # get 'products/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products do 
      resources :orders
    end
  end
  
  # Defines the root path route ("/")
  # root "articles#index"

end
