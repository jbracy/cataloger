require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  
  test 'should create user session' do
    user = Factory.create(:user)
    post :create, :user_session => { :username => user.username,
                                     :password => user.password }
    assert user_session = UserSession.find
    assert_equal user, user_session.user
    assert_redirected_to root_url
  end
  
  test 'should destroy user session' do
    user = Factory.create(:user)
    post :create, :user_session => { :username => user.username,
                                     :password => user.password }
    delete :destroy
    assert_equal nil, UserSession.find
  end
  
  # = Routing Tests ===========================================================
  
  test 'should route to new' do
    assert_routing '/login', path_with_action('new')
    assert_recognizes path_with_action('new'), '/login'
  end
  
  test 'should route to create' do
    assert_routing '/login', path_with_action('new')
    assert_recognizes path_with_action('new'), '/login'
  end
  
  test 'should route to destroy' do
    assert_routing({ :method => :delete, :path => '/logout' }, path_with_action('destroy'))
    assert_recognizes(path_with_action('destroy'), { :method => :delete, :path => '/logout' })
  end
  
end
