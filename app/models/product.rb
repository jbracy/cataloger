class Product < ActiveRecord::Base
  
  belongs_to :catalog, :inverse_of => :products
  has_many :categorizations, :inverse_of => :product
  has_many :categories, :through => :categorizations, :inverse_of => :products, :dependent => :destroy
  
  has_attached_file :image, :styles => {
    :large => ["1024x1024>", :jpg],
    :medium => ["300x300>", :jpg],
    :thumb => ['100x100>', :jpg] }
  
  accepts_nested_attributes_for :categorizations, :allow_destroy => true
  validates :catalog, :presence => true
  validates :sku, :uniqueness => { :scope => :catalog_id, :allow_nil => true }
  
end
