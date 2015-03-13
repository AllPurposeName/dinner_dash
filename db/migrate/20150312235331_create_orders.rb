class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
