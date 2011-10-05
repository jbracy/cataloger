class Catalog < ActiveRecord::Base
  
  belongs_to :user, :inverse_of => :catalogs
  has_many :products, :inverse_of => :catalog
  has_many :categories
      
  validates_presence_of :user, :title
  
end
