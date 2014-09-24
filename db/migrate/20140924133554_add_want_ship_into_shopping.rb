class AddWantShipIntoShopping < ActiveRecord::Migration
  def change
    add_column :shoppings,:want_ship,:string
  end
end
