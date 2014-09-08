class Mobile::CartsController < Mobile::BaseController
  def show
    @cart = Cart.find(params[:id])
  end

  def edit
    @cart = Cart.find(params[:id])
  end
  
  
  def update
    @cart = Cart.find(params[:id])
    if @cart.total_count < 1
      redirect_to edit_mobile_cart_path(@cart)
      return
    end

    if @cart.update(cart_params)
      redirect_to new_mobile_shopping_path(:cart_id=>@cart)
    end
  end
  
  private
  def cart_params
    params.require(:cart).permit!
  end
end