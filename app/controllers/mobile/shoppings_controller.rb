class  Mobile::ShoppingsController < Mobile::BaseController  
  def index
  end
  
  def show
    
  end
  
  def create
    @shopping = Shopping.new(shopping_params)
    @cart = Cart.find(@shopping.cart_id)
    
    @cart.cart_items.each do |cart_item|
      shopping_item = ShoppingItem.new
      shopping_item.product_id = cart_item.product_id
      shopping_item.no  = cart_item.no
      shopping_item.name  = cart_item.name
      shopping_item.price  = cart_item.price
      shopping_item.quantity  = cart_item.quantity
      shopping_item.amount  = cart_item.amount
      @shopping.shopping_items << shopping_item
    end
    
    if @shopping.save
      redirect_to mobile_products_path
    else
      render 'new'
    end
  end
  
  
  def new
    if params[:cart_id].present?
      @shopping = Shopping.new
      @shopping.cart_id = params[:cart_id]
    else
      redirect_to mobile_products_path
    end
  end
  
  private
  def shopping_params
    params.require(:shopping).permit!
  end
end