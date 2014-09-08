class  Mobile::ShoppingsController < Mobile::BaseController  
  def index
  end
  
  def show
    
  end
  
  
  def new
    if params[:cart_id].present?
      @shopping = Shopping.new
    else
      redirect_to mobile_products_path
    end
  end
  
  
end