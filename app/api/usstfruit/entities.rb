require 'grape'
module Usstfruit
  module Entities
    class ShoppingItem  < Grape::Entity
      expose :id, :no, :name, :price, :quantity, :amount
    end
  
    class Shopping   < Grape::Entity
      expose :id, :customer_name, :customer_address, :mobile, :created_at, :status,:amount
      expose :shopping_items, :using => Entities::ShoppingItem, :unless => { :collection => true }
    end
    

  end
end
