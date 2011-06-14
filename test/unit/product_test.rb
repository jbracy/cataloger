require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test 'valid product' do
    assert Factory.build(:product).valid?
  end
  
  test 'validates prescence of catalog' do
    product = Factory.build(:product, :catalog => nil)
    assert !product.valid?
    assert product.errors[:catalog]
  end
  
  test 'validates teh uniquness of sku within the catalog' do
    catalog = Factory(:catalog)
    Factory(:product, :sku => "12345", :catalog => catalog)
    product = Factory.build(:product, :sku => "12345", :catalog => catalog)
    assert !product.valid?
    assert product.errors[:sku]
  end
  
end
