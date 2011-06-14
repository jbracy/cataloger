require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test 'valid category' do
    assert Factory.build(:category).valid?
  end
  
  test 'validates prescence of catalog' do
    category = Factory.build(:category, :catalog => nil)
    assert !category.valid?
    assert category.errors[:category]
  end
  
  test 'validates prescence of name' do
    category = Factory.build(:category, :name => nil)
    assert !category.valid?
    assert category.errors[:name]
  end
  
  test 'validates the uniquness of name within the catalog' do
    catalog = Factory(:catalog)
    Factory(:category, :name => "Test Category", :catalog => catalog)
    category = Factory.build(:category, :name => "Test Category", :catalog => catalog)
    assert !category.valid?
    assert category.errors[:name]
  end
  
end
