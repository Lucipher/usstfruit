class Admin::ShoppingsController <  Admin::BaseController
  def index
    @q = Shopping.search(params[:q])
    @shoppings = @q.result(distinct: true).order("created_at desc")
    @shoppings_grid = initialize_grid(@shoppings,:per_page => 50)
  end
  
  def show
    @shopping = Shopping.find(params[:id])
  end
  
  def operation_history
    @shopping = Shopping.find(params[:id])
  end
  
  def update_field
    @shopping=Shopping.find(params[:id])
    name = params[:name]
    value = params[:value]
    @shopping.update({name=>value})
    render :status=>200, :json=> {:message=>"OK"}
  end
  
  
  
  def destroy
    @shopping = Shopping.find(params[:id])
    @shopping.destroy
    redirect_to admin_shoppings_path,:notice=>"删除订单成功"
  end
  
  def to_confirm
    @shopping = Shopping.find(params[:id])
    @shopping.confirm
    @shopping.save
    redirect_to [:admin,@shopping],:notice=>"订单已确认配货"
  end
  
  
  def to_ship
    @shopping = Shopping.find(params[:id])
    @shopping.ship
    @shopping.save
    redirect_to [:admin,@shopping],:notice=>"订单已确认配货"
  end
  
  def to_finish
    @shopping = Shopping.find(params[:id])
    @shopping.finish
    @shopping.save
    redirect_to [:admin,@shopping],:notice=>"订单已确认配货"
  end
  def to_cancel
    @shopping = Shopping.find(params[:id])
    @shopping.cancel
    @shopping.save
    redirect_to [:admin,@shopping],:notice=>"订单已被取消"
  end
end