class EditColumnInCats < ActiveRecord::Migration
  def change
    change_column :cats, :image_path, :string, default: nil
  end
end
