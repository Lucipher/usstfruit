class  Admin::ProductsController < Admin::BaseController  
  def index
    @q = Product.search(params[:q])
    @products = @q.result(distinct: true).order("priority desc")
    @products_grid = initialize_grid(@products,:per_page => 20)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product),:notice=>"新建商品成功"
    else
      render 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product),:notice=>"更新商品种功"
    else
      redirect_to 'edit'
    end
  end
  
  
  private
  def product_params
    params.require(:product).permit!
  end
end