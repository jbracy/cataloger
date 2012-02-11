class Categorization < ActiveRecord::Base
  attr_accessible :product_id
  attr_accessible :category_id
  
  belongs_to :product, :inverse_of => :categorizations
  belongs_to :category, :inverse_of => :categorizations
  
  validates :product, :presence => true
  validates :category, :presence => true
  validates_uniqueness_of :product_id, :scope => :category_id
end