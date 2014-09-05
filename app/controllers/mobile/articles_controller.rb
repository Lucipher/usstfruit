class Mobile::ArticlesController <  Mobile::BaseController
  layout "mobile_article"
  def show
    @article = Article.find(params[:id])
  end
end