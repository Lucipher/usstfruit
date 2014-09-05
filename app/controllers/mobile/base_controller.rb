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
  
end

