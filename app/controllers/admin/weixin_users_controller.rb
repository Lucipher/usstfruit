class Admin::WeixinUsersController <  Admin::BaseController
  def index
    @q = WeixinUser.search(params[:q])
    @users = @q.result(distinct: true)
    @users_grid = initialize_grid(@users,:per_page => 20)
  end
  
  
  def show
    @user = WeixinUser.find params[:id]
  end
  
  def edit
    @user = WeixinUser.find params[:id]
  end
  
  private 
  
  def weixin_user_params
    params.require(:weixin_user).permit!
  end
  
end