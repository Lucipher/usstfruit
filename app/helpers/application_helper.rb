module ApplicationHelper
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart=Cart.create
    session[:cart_id]=cart.id
    cart
  end
  
  def current_weixin_user_id
    session[:weixin_user_id]
  end
end
