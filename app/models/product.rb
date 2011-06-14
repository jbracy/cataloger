class Product < ActiveRecord::Base
  belongs_to :catalog, :inverse_of => :products
  has_attached_file :image, :styles => {
    :large => ["1024x1024>", :png],
    :medium => ["300x300>", :jpg],
    :thumb => ['100x100>', :jpg] }
  
  validates :catalog, :presence => true
  validates :sku, :uniqueness => { :scope => :catalog_id, :allow_nil => true }
  
end
