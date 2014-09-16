class Admin::ShoppingsController <  Admin::BaseController
  def index
    @q = Shopping.search(params[:q])
    @shoppings = @q.result(distinct: true)
    @shoppings_grid = initialize_grid(@shoppings,:per_page => 50)
  end
  
  def show
  end
end