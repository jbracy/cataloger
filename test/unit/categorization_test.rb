require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  
  test 'valid categorization' do
    assert Factory.build(:categorization).valid?
  end
  
  test 'validates prescence of category' do
    category = Factory.build(:categorization, :category => nil)
    assert !category.valid?
    assert category.errors[:category]
  end
  
  test 'validates prescence of product' do
    category = Factory.build(:categorization, :product => nil)
    assert !category.valid?
    assert category.errors[:product]
  end
  
  test 'uniquness of product within the category' do
    category = Factory(:categorization).category
    category2 = Factory.build(:categorization, :category => category, :product => category.products.first)
    assert !category2.valid?
    assert category2.errors[:product]
  end
  
end
