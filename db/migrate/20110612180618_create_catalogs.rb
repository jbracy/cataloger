class CreateCatalogs < ActiveRecord::Migration

  def change
    create_table :catalogs do |t|
      t.integer :user_id, :null => false
      t.string  :title, :null => false
      
      t.timestamps
    end
    
    add_index :catalogs, :user_id
  end
  
end
