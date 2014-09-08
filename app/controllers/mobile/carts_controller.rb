class Mobile::CartsController < Mobile::BaseController
  def show
    @cart = Cart.find(params[:id])
  end

  def edit
    @cart = Cart.find(params[:id])
  end
end