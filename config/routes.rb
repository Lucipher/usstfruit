Usstfruit::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  
  namespace :mobile do
    root :to => 'home#index'
    get "two",:controller=>:home,:action=>:test
    resources :products
    resources :articles
    
    #shopping part
    resources :carts
    resources :cart_items do
      collection do
        get 'plus'
        get 'minus'
      end
    end
    
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
