class Shopping < ActiveRecord::Base
  has_many :shopping_items
  after_create :save_shopping_items
  validates :customer_name,:customer_address,:mobile,:presence => true
  
  
  def save_shopping_items
    shopping_items.each do |item|
      item.save
    end
  end
end