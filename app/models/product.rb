class Product < ActiveRecord::Base

  belongs_to :product_cate
  mount_uploader :cover, ProductCoverUploader

end