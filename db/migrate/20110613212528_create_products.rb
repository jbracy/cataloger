class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :catalog_id,  :null => false
      t.string  :sku
      t.string  :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string  :image_file_name
      t.string  :image_content_type
      t.integer :image_file_size
      
      t.timestamps
    end
    
    add_index :products, [:catalog_id, :id], :unique => true
    add_index :products, [:catalog_id, :sku], :unique => true
  end
end
