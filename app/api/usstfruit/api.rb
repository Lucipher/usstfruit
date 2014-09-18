require "usstfruit/entities"
require 'rack/contrib'

module Usstfruit
  class API < Grape::API
    use Rack::JSONP
    
    prefix "api"
    format :json

      
    resource :shoppings do
      get do
        @shoppings = Shopping.all.order("created_at desc")
        present @shoppings, :with => Entities::Shopping
      end
      
      get ":id" do
        @shopping = Shopping.includes(:shopping_items).find(params[:id])
        present @shopping, :with => Entities::Shopping
      end
      
      
    end
  end

end