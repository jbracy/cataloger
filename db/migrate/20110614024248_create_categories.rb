class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :catalog_id, :null => false
      t.string :name, :null => false
      
      t.timestamps
    end
    
    add_index :categories, [:catalog_id, :id], :unique => true
    add_index :categories, :name, :unique => true
  end
end
