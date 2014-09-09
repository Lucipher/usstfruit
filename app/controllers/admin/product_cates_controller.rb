class  Admin::ProductCatesController < Admin::BaseController  
  def index
    @q = ProductCate.search(params[:q])
    @product_cates = @q.result(distinct: true).order("priority desc")
    @product_cates_grid = initialize_grid(@product_cates,:per_page => 20)
  end

  def show
    @product_cate = ProductCate.find(params[:id])
  end


  def new
    @product_cate = ProductCate.new
  end

  def create
    @product_cate = ProductCate.new(product_cate_params)
    if @product_cate.save
      redirect_to admin_product_cates_path,:notice=>"新建商品种类信息成功"
    else
      render 'new'
    end
  end

  def edit
    @product_cate = ProductCate.find(params[:id])
  end

  def update
    @product_cate = ProductCate.find(params[:id])
    if @product_cate.update(product_cate_params)
      redirect_to admin_product_cates_path,:notice=>"更新商品种类成功"
    else
      redirect_to 'edit'
    end
  end

  private
  def product_cate_params
    params.require(:product_cate).permit!
  end

end