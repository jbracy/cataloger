class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :category_id, :null => false
      t.integer :product_id, :null => false
      
      t.timestamps
    end
    
    add_index :categorizations, [:category_id, :product_id], :unique => true
  end
end
