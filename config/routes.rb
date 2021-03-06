Usstfruit::Application.routes.draw do
  devise_for :users
  mount WeixinRailsMiddleware::Engine, at: "/"
  mount Usstfruit::API => "/"
  
  namespace :mobile do
    root :to => 'products#index'
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
    resources :shoppings
    resources :weixin_users do
      member do 
        get 'history_shopping'
      end
    end
    
 end
 
 namespace :admin do
   root :to => 'home#index'
   
   resources :weixin_users
   
   resources :products do
     member do
       get 'on_sale'
       get 'off_sale'
     end
   end
   
   resources :product_cates
   resources :shoppings do
     member do
       get 'to_cancel'
       get 'to_confirm'
       get 'to_ship'
       get 'to_finish'
       
       get 'operation_history'
       
       put 'update_field'
       
       
       get 'daily_result'
     end
   end
   
   resources :articles
   resources :article_cates
   resources :users
   
   resources :pictures do
     collection do
       post 'upload'
     end
   end
 end
end
