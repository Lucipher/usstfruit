Usstfruit::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"

  

  
  
  namespace :mobile do
    root :to => 'home#index'
    get "two",:controller=>:home,:action=>:test
    resources :products
    resources :cart_product_items
 end
end
