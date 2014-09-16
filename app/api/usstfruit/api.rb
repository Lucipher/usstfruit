require "usstfruit/entities"
require 'rack/contrib'

module Usstfruit
  class API < Grape::API
    use Rack::JSONP
    
    prefix "api"
    format :json

      
    resource :shoppings do
      get do
        @shoppings = Shopping.all
        present @shoppings, :with =>Entities::Shopping
      end
    end
  end

end