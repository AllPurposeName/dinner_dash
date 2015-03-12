class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.text :name
      t.integer :price
      t.boolean :retired
      t.text :image_path
      t.text :description

      t.timestamps null: false
    end
  end
end
