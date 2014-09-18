class Admin::ShoppingsController <  Admin::BaseController
  def index
    @q = Shopping.search(params[:q])
    @shoppings = @q.result(distinct: true)
    @shoppings_grid = initialize_grid(@shoppings,:per_page => 50)
  end
  
  def show
    @shopping = Shopping.find(params[:id])
  end
  
  
  def to_cancel
    @shopping = Shopping.find(params[:id])
    @shopping.confirm
    @shopping.cancel
    
    render :text=> @shopping.confirmed_at
  end
end