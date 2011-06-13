class CreateUsers < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.string :username,             :null => false
      t.string :email,                :null => false
      t.string :crypted_password,     :null => false
      t.string :password_salt,        :null => false
      t.string :persistence_token,    :null => false
      t.string :single_access_token,  :null => false
      t.string :perishable_token,     :null => false
      
      t.timestamps
    end
    
    add_index :users, :email, :unique => true
    add_index :users, :username, :unique => true
    add_index :users, :single_access_token, :unique => true
    add_index :users, :persistence_token, :unique => true
    add_index :users, :perishable_token, :unique => true
  end
  
end
