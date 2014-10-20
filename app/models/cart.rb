class Cart < ActiveRecord::Base
  belongs_to :weixin_user
  has_many :cart_items
  
  
  def total_count
    self.cart_items.inject(0) { |sum, i| sum+i.quantity }
  end
  
  def total_amount
    self.cart_items.inject(0) { |sum, i| sum+i.amount }
  end
  
  def check_any_off_sale?
    result = false
    self.cart_items.each do |cart_item|
       unless cart_item.product.on_sale?
         cart_item.quantity = 0
         cart_item.amount = 0
         cart_item.save
         result = true
       end
    end
    result
  end
  
  def add_item(item)
    puts "id is #{item.product_id}"
    current_item = cart_items.find_by_product_id(item.product_id)    
    if current_item
      current_item.quantity+=item.quantity
      puts current_item.to_json
    else
      current_item = item
      item.cart = self
    end
    current_item.cal_amount
    current_item
  end
end