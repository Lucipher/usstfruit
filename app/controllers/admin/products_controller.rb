class  Admin::ProductsController < Admin::BaseController  
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true)
    @products_grid = initialize_grid(@products,:per_page => 20)
  end
end