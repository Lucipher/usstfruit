Usstfruit::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  root 'home#index'
  get "two",:controller=>:home,:action=>:test
  
  resources :products
  resources :cart_product_items
  
end
