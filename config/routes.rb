Usstfruit::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  
  namespace :mobile do
    root :to => 'home#index'
    get "two",:controller=>:home,:action=>:test
    resources :products
    resources :cart_product_items
    resources :articles
    
 end
 
 namespace :admin do
   root :to => 'home#index'
   resources :products
   resources :product_cates
   
   resources :articles
   resources :article_cates
   
   resources :pictures do
     collection do
       post 'upload'
     end
   end
 end
end
