Usstfruit::Application.routes.draw do
  root 'home#index'
  get "two",:controller=>:home,:action=>:test
  
  resources :products
  resources :cart_product_items
  
end
