class ChangeCatImagePathDefault < ActiveRecord::Migration
  def change
    change_column :cats, :image_path, :string, default: "cat.jpg"
  end
end
