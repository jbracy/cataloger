class Catalog < ActiveRecord::Base
  
  belongs_to :user, :inverse_of => :catalogs
  has_many :products, :inverse_of => :catalog, :dependent => :destroy
  has_many :categories, :inverse_of => :catalog, :dependent => :destroy

  validates_presence_of :user, :title
  
end
