class Article < ActiveRecord::Base
  belongs_to :article_cate
  validates :title,:presence => true
  mount_uploader :cover, ArticleCoverUploader
end