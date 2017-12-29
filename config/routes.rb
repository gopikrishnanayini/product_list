Rails.application.routes.draw do

  get 'categories/index'
  root 'categories#index'

  resources :categories do 
  	resources :products 
  end
 resources :products do
 	resources :users
 end
end
