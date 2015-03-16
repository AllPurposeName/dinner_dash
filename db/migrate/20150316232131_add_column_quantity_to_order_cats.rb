class AddColumnQuantityToOrderCats < ActiveRecord::Migration
  def change
    add_column :order_cats, :quantity, :integer
  end
end
