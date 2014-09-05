class  Mobile::ProductsController < Mobile::BaseController  
  def index
    @product_cates = ProductCate.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end