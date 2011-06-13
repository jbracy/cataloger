require 'test_helper'

class CatalogTest < ActiveSupport::TestCase
  
  test 'valid catalog' do
    assert Factory.build(:catalog).valid?
  end
  
  test 'validates presence of user' do
    catalog = Factory.build(:catalog, :user => nil)
    assert !catalog.valid?
    assert catalog.errors[:user]
  end
  
  test 'validates presence of title' do
    catalog = Factory.build(:catalog, :title => nil)
    assert !catalog.valid?
    assert catalog.errors[:title]
  end
  
end
