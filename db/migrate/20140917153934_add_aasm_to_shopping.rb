class AddAasmToShopping < ActiveRecord::Migration
  def change
    add_column :shoppings,:confirmed_at,:datetime
    add_column :shoppings,:shipped_at,:datetime
    add_column :shoppings,:aasm_state,:string
  end
end
