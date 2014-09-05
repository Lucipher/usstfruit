class Mobile::BaseController < ApplicationController
  layout "mobile"
  before_filter :set_current_weixin_user
  
  def set_current_weixin_user
    if params[:weichat_id].present?
      @user = WeixinUser.find_by_open_id(params[:weichat_id])
      if @user
        session[:weixin_user_id] = @user.id
      else
        @user = WeixinUser.new
        @user.open_id =  params[:weichat_id]
        @user.save
        session[:weixin_user_id] = @user.id
      end
    end
  end
  
  def current_weixin_user_id
    session[:weixin_user_id]
  end
  
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart=Cart.create
    session[:cart_id]=cart.id
    cart
  end
  
  
end

