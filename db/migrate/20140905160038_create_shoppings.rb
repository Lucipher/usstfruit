class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :cart_id
      t.string :status
      
      t.string :pay_status
      t.string :ship_status
      t.string :ship
      t.string :payment
      t.integer :quantity
      
      t.integer :weixin_user_id
      
      t.string :customer_name
      t.string :customer_address
      t.string :mobile
      t.text :remark
      
      t.datetime :ship_time
      
      t.decimal :cost_item,:default=>0, :precision => 20, :scale => 2
      t.decimal :cost_ship,:default=>0, :precision => 20, :scale => 2
      t.decimal :amount,:default=>0, :precision => 20, :scale => 2
      t.datetime :closed_at
      
      t.integer :closed_user_id
      t.datetime :canceled_at
      t.timestamps
    end

    create_table :shopping_items do |t|
      t.integer :product_id
      t.integer :shopping_id
      t.string :no
      t.string :name
      t.integer :point
      t.integer :unit

      t.decimal :price,:default=>0, :precision => 20, :scale => 2
      t.integer :quantity
      t.decimal :amount,:default=>0, :precision => 20, :scale => 2
      t.timestamps
    end

    create_table :carts do |t|
      t.integer :weixin_user_id
      t.text :remark
      t.timestamps
    end

    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.string :no
      t.string :name
      t.integer :point
      t.decimal :price,:default=>0, :precision => 20, :scale => 2
      t.integer :quantity
      t.decimal :amount,:default=>0, :precision => 20, :scale => 2
      t.timestamps
    end
  end
end
