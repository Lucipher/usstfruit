class Shopping < ActiveRecord::Base
  include AASM
  has_many :shopping_items,:dependent => :destroy
  belongs_to :cart
  after_create :save_shopping_items
  before_save :update_status
  validates :customer_name,:customer_address,:mobile,:presence => true



   aasm do
     state :new, :initial => true
     state :confirmed
     state :shipping
     state :finished
     state :canceled
     
     event :confirm do
       transitions :from => :new, 
                    :to => :confirmed,:on_transition => :confirm_shopping
     end
     
     event :ship do
       transitions :from => :confirmed, 
                    :to => :shipping,:on_transition => :shipping_shopping
     end
     
     event :finish do
       transitions :from => :shipping, 
                    :to => :finished,:on_transition => :finish_shopping
     end
     
     
     event :cancel do
       transitions :from => [:new,:confirmed,:shipping,:finished], 
                   :to => :canceled,:on_transition => :cancel_shopping
     end
     
     
   end



  
  
  def confirm_shopping
    self.confirmed_at = Time.now
  end
  
  def shipping_shopping
    self.shipped_at = Time.now
  end
  
  
  def finish_shopping
    self.closed_at = Time.now
  end
  

  
  def cal_amount
    self.amount = self.shopping_items.inject(0) { |sum, i| sum+i.amount }
  end
  
  def cancel_shopping
    self.canceled_at = Time.now
  end
    

  
  def save_shopping_items
    shopping_items.each do |item|
      item.save
    end
  end
  
  def update_status
    if self.aasm_state == "new"
      self.status = "新订单"
    elsif self.aasm_state == "confirmed"
      self.status = "配货中"

    elsif self.aasm_state == "shipping"
      self.status = "配送中"

    elsif self.aasm_state == "finished"
      self.status = "订单完成"
    elsif self.aasm_state == "canceled"
      self.status = "订单取消"
    end

  end
  
end


