class CreateCatBreeds < ActiveRecord::Migration
  def change
    create_table :cat_breeds do |t|
      t.references :cat
      t.references :breed

      t.timestamps null: false
    end
  end
end
