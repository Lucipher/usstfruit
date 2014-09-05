class WeixinUser < ActiveRecord::Base
  validates :open_id, uniqueness: true
end