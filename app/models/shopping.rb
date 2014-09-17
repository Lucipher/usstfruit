class Shopping < ActiveRecord::Base
  include AASM

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
     
     event :cancel do
       transitions :from => [:new,:confirmed,:shipping,:finished], 
                   :to => :canceled,:on_transition => :cancel_shopping
     end
     
     
   end


  
  has_many :shopping_items
  after_create :save_shopping_items
  validates :customer_name,:customer_address,:mobile,:presence => true
  
  
  
  def confirm_shopping
    self.confirmed_at = Time.now
  end
  
  def ship_shopping
    self.shiped_at = Time.now
  end
  
  
  def cancel_shopping
    self.canceled_at = Time.now
  end
    

  
  def save_shopping_items
    shopping_items.each do |item|
      item.save
    end
  end
end


