class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.string :password_digest
      t.integer :role
      t.text :last_name
      t.string :email

      t.timestamps null: false
    end
  end
end
