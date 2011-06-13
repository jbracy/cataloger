require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test 'valid user' do
    assert Factory.build(:user).valid?
  end
  
  test 'should require acceptance of terms of service' do
    user = Factory.build(:user, :terms_of_service => false)
    assert !user.valid?
    assert user.errors[:terms_of_service]
  end

end
