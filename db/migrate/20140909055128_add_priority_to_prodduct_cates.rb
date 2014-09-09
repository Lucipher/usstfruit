class AddPriorityToProdductCates < ActiveRecord::Migration
  def change
    add_column :products , :published_at,:datetime
    add_column :products , :off_sale_at,:datetime
    add_column :product_cates, :priority ,:integer
  end
end
