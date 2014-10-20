class Mobile::CartItemsController < Mobile::BaseController
  def create
    if params[:cart_item][:quantity].present? && params[:cart_item][:product_id].to_i > 0
      @cart_item = CartItem.new(cart_item_params)
      @product = Product.find(@cart_item.product_id)
      if @product.on_sale == false
        @success = false
      end
      
      @cart_item.build_with_product(@product)
      @cart_item.quantity = params[:cart_item][:quantity]
      @cart_item = current_cart.add_item(@cart_item)
      @success = @cart_item.save
    else
       @success =false
    end
  end
  
  def destroy
    @success = false
    @cart_item = CartItem.find(params[:id])
    @success = @cart_item.destroy
  end
  
  
  def plus
    @success = false
    
    if params[:cart_id].present? & params[:product_id].present?
      @cart = Cart.find(params[:cart_id])
      @product = Product.find(params[:product_id])
      @cart_item = @cart.cart_items.find_by_product_id(params[:product_id])
      if @cart_item.nil?
        @product = Product.find(params[:product_id])
        @cart_item = CartItem.new
        @cart_item.product_id = @product.id
        @cart_item.cart_id = @cart.id
        
        @cart_item.no = @product.no
        @cart_item.name = @product.name
        @cart_item.point = @product.point
        @cart_item.price = @product.price
      else
        @cart_item.price =  @product.price
      end
      
      @cart_item.quantity = @cart_item.quantity.to_i + 1
      @cart_item.amount = @cart_item.quantity  * @cart_item.price
      @cart_item.save
    end
    
    

  end
  
  def minus
    @success = false
    if params[:cart_id].present? & params[:product_id].present?
      @cart = Cart.find(params[:cart_id])
      @product = Product.find(params[:product_id])
      @cart_item = @cart.cart_items.find_by_product_id(params[:product_id])
      if @cart_item
        @cart_item.price =  @product.price
        @cart_item.quantity = @cart_item.quantity.to_i - 1
        @cart_item.amount = @cart_item.quantity  * @cart_item.price
        @cart_item.save
      end
    end
  end
  
  
  
  private 
  
  def cart_item_params
    params.require(:cart_item).permit!
  end
  
end