class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_acceptance_of :terms_of_service
  
  has_many :catalogs, :inverse_of => :user
end
