class RenameLastnameInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :last_name, :full_name 
  end
end
