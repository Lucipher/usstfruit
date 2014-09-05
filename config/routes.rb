Usstfruit::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  
  namespace :mobile do
    root :to => 'home#index'
    get "two",:controller=>:home,:action=>:test
    resources :products
    resources :cart_product_items
 end
 
 namespace :admin do
   root :to => 'home#index'
   resources :products
   resources :articles
   resources :article_cates
   
   resources :pictures do
     collection do
       post 'upload'
     end
   end
   
end
