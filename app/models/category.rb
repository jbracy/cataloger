class Category < ActiveRecord::Base
  
  belongs_to :catalog, :inverse_of => :categories
  has_many :categorizations, :inverse_of => :categories
  has_many :products, :through => :categorizations, :inverse_of => :categories, :dependent => :destroy
    
  accepts_nested_attributes_for :categorizations, :allow_destroy => true
  validates :catalog, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => [:catalog_id]} 
  
end