class Product < ActiveRecord::Base
  @jaccard_index 
  
  # 运行中定义 jaccard_index 的取值 singleton 方法
      def jaccard_index
        @jaccard_index
      end

      # 还有赋值方法
      def jaccard_index= index
        @jaccard_index = index || 0.0
      end
end

class ProductCounter

  def initialize product,products,shoppings
     @product,@products,@shoppings = product,products,shoppings
  end

  def count
    @products.map do |product|
      product.jaccard_index = 0
    end

     @shoppings.each do |shopping|
       unless shopping.shopping_items.find_by_name(@product.name)
         next
       end
       shopping.shopping_items.each do  |shopping_item|
         shopping_product = nil
         @products.map do |product|
           if shopping_item.name == product.name
             shopping_product = product 
           end
         end
         if shopping_product
           if shopping_product.jaccard_index
             shopping_product.jaccard_index += 1 
           else
              shopping_product.jaccard_index= 1
           end
         end
       end
     end

     @products.sort_by { |product| -product.jaccard_index }
  end

end



PRODUCTS = Product.all
SHOPPINGS = Shopping.all
PRODUCTS.each do |product|
  products = ProductCounter.new(product,PRODUCTS, SHOPPINGS).count
  puts "水果: #{product.name}"
  products.each {|x| puts "#{x.name} - #{x.jaccard_index}"}
  puts '------'
end