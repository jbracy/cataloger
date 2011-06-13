class Catalog < ActiveRecord::Base
  
  belongs_to :user, :inverse_of => :catalogs
  
  validates_presence_of :user, :title
  
end
