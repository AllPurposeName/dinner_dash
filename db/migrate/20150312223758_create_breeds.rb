class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.text :name
      t.text :image_path
      t.boolean :retired
      t.text :description

      t.timestamps null: false
    end
  end
end
