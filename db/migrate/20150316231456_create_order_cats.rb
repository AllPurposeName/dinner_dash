class CreateOrderCats < ActiveRecord::Migration
  def change
    create_table :order_cats do |t|
      t.references :cat
      t.references :order

      t.timestamps null: false
    end
  end
end
