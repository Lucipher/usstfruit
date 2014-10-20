class Product < ActiveRecord::Base

  belongs_to :product_cate
  mount_uploader :cover, ProductCoverUploader
  
  scope :can_sale, -> { where(on_sale: true) }
  
  def sale?
    self.on_sale
  end
  
  def change_on_sale
    self.on_sale = true
  end
  
  def change_off_sale
    self.on_sale = false
  end
end