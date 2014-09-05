class  Admin::ArticlesController < Admin::BaseController  
  def index
     @q = Article.search(params[:q])
      @articles = @q.result(distinct: true)
      @articles_grid = initialize_grid(@articles,:per_page => 20)
  end
    
  def new
    @article = Article.new
  end

end