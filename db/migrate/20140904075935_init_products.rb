class InitProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :no
      t.string :cover
      t.string :name
      
      t.integer :product_cate_id
      t.text :brief
      t.text :content, :limit => 4294967295
      
      t.string :unit
      t.string :keywords
      
      t.boolean :on_sale,:default=>true
      
      t.decimal :mk_price,:default=>0, :precision => 20, :scale => 2
      t.decimal :price,:default=>0, :precision => 20, :scale => 2
      
      t.integer :point,:default=>0
      t.integer :store,:default=>0
      t.integer :priority
      t.timestamps
    end
    
    create_table :product_cates do |t|
      t.string :name
      t.text :content
      t.timestamps
    end
    
    create_table :weixin_users do |t|
      t.string :open_id
      t.string :username
      t.string :role
      t.string :phone
      t.string :address
      t.string :status
      t.datetime :closed_at
      t.datetime :subcribled_at      
      t.timestamps
    end
    
    
    create_table :articles do |t|
      t.string :cover
      t.text :content, :limit => 4294967295
      t.string :title
      t.string :keywords
      t.string :breif
      t.integer :article_cate_id
      t.boolean :hidden,:default=>true
      t.datetime :post_time
      t.timestamps
    end

    create_table :article_cates do |t|
      t.string :name
      t.string :no
      t.string :keywords
      t.timestamps
    end
    
    
  end
end
