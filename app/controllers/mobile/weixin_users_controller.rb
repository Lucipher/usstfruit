class  Mobile::WeixinUsersController < Mobile::BaseController  
  def index
    
  end
  
  def show
    @weixin_user = WeixinUser.find(params[:id])
  end
  
  def history_shopping
    @weixin_user = WeixinUser.find(params[:id])
    @shoppings = Shopping.where("weixin_user_id = ?",@weixin_user.id).order("created_at desc")
  end

end