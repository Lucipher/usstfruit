class  Mobile::ShoppingsController < Mobile::BaseController  
  def index
  end
  
  def show
    @shopping = Shopping.find(params[:id])
  end
  
  def create
    @shopping = Shopping.new(shopping_params)
    
    logger.info("new shopping from cart id :#{@shopping.cart_id}")
    @cart = Cart.find(@shopping.cart_id)
    
    @cart.cart_items.each do |cart_item|
      if cart_item.quantity > 0 && cart_item.product.on_sale?
        shopping_item = ShoppingItem.new
        shopping_item.product_id = cart_item.product_id
        shopping_item.no  = cart_item.no
        shopping_item.name  = cart_item.name
        shopping_item.price  = cart_item.price
        shopping_item.quantity  = cart_item.quantity
        shopping_item.amount  = cart_item.amount
        @shopping.shopping_items << shopping_item
      end
    end
    @shopping.cal_amount
    @shopping.weixin_user_id = current_weixin_user_id
    if @shopping.save
      session[:cart_id]=nil
      redirect_to history_shopping_mobile_weixin_user_path(current_weixin_user_id)
    else
      render 'new'
    end
  end
  
  
  def new
    if params[:cart_id].present? 
      @shopping = Shopping.new
      @shopping.cart_id = params[:cart_id]
      
      @cart = Cart.find(@shopping.cart_id)
      
      if @cart.check_any_off_sale?
        redirect_to edit_mobile_cart_path(@cart)
      end
      
      @shopping.remark = @cart.remark

    else
      redirect_to mobile_products_path
    end
  end
  
  private
  def shopping_params
    params.require(:shopping).permit!
  end
end