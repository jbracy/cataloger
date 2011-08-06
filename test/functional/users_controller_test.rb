require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test 'new should require no user' do
    user = Factory(:user)
    UserSession.create(user)
    get :new
    assert_response :redirect
  end
  
  test 'create should require no user' do
    user = Factory(:user)
    UserSession.create(user)
    post :create
    assert_response :redirect
  end
  
  test 'show should require user' do
    get :show
    assert_response :redirect
    assert_redirected_to login_path
  end
  
  test 'edit should require user' do
    get :edit
    assert_response :redirect
    assert_redirected_to login_path
  end
  
  test 'update should require user' do
    put :update
    assert_response :redirect
    assert_redirected_to login_path
  end
  
  test 'should create user' do
    attrs = { :username => Faker::Internet.user_name,
      :email => Faker::Internet.email,
      :password => "my password",
      :password_confirmation => "my password" }
      
    assert_difference('User.count') do
      post :create, :user => attrs
    end
    
    assert assigns(:user).valid?
    assert_redirected_to account_path
  end
  
  test 'should update user' do
    user = Factory(:user)
    UserSession.create(user)
    put :update, :user => { :email => "different_email@example.com" }
    assert_equal "different_email@example.com", assigns(:user).email
    assert_redirected_to account_path
  end
  
  # = Render Tests ============================================================
  
  test 'should render new' do
    get :new
    assert_response :success
    assert_template 'new'
  end
  
  test 'should render show' do
    UserSession.create(Factory(:user))
    get :show
    assert_response :success
    assert_template 'show'
  end
  
  test 'should render edit' do
    UserSession.create(Factory(:user))
    get :edit
    assert_response :success
    assert_template 'edit'
  end
  
  # = Routing Tests ===========================================================
  
  test 'should route to new' do
    assert_routing '/signup', path_with_action('new')
    assert_recognizes path_with_action('new'), '/signup'
  end
  
  test 'should route to show' do
    assert_routing '/account', path_with_action('show')
    assert_recognizes path_with_action('show'), '/account'
  end
  
  test 'should route to edit' do
    assert_routing '/account/edit', path_with_action('edit')
    assert_recognizes path_with_action('edit'), '/account/edit'
  end
  
  test 'should route to update' do
    assert_routing({ :method => :put, :path => '/account'}, path_with_action('update'))
    assert_recognizes(path_with_action('update'), { :method => :put, :path => '/account'})
  end
  
  test 'should route to create' do
    assert_routing({ :method => :post, :path => '/account' }, path_with_action('create'))
    assert_recognizes(path_with_action('create'), { :method => :post, :path => '/account' })
  end
  
end
