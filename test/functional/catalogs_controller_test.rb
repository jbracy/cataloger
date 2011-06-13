require 'test_helper'

class CatalogsControllerTest < ActionController::TestCase
  
  def setup
    @current_user = Factory.create(:user)
    UserSession.create(@current_user)
  end
  
  def teardown
    logout
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert assigns(:catalogs)
    assert_equal @current_user.catalogs, assigns(:catalogs)
  end
  
  test 'show' do
    catalog = Factory(:catalog, :user => @current_user)
    get :show, :id => catalog.id
    assert assigns(:catalog)
    assert_equal catalog, assigns(:catalog)
    assert_response :success
  end
  
  test 'edit' do
    catalog = Factory(:catalog, :user => @current_user)
    get :edit, :id => catalog.id
    assert assigns(:catalog)
    assert_equal catalog, assigns(:catalog)
    assert_response :success
  end
  
  test 'create' do
    post :create, :catalog => Factory.attributes_for(:catalog)
    assert assigns(:catalog)
    assert assigns(:catalog).valid?
    assert_equal @current_user, assigns(:catalog).user
    assert_response :redirect
    assert_redirected_to catalog_path(assigns(:catalog))
  end
  
  test 'update' do
    catalog = Factory(:catalog, :user => @current_user)
    put :update, :id => catalog.id, :catalog => {:title => "Test Title"}
    assert assigns(:catalog)
    assert_equal "Test Title", assigns(:catalog).title
    assert_equal "Test Title", Catalog.find(catalog.id).title
    assert_response :redirect
    assert_redirected_to catalog_path(catalog)
  end
  
  # = Render Tests ============================================================
  
  test 'should render index' do
    get :index
    assert_response :success
    assert_template 'index'
  end
  
  test 'should render show.tex' do
    catalog = Factory(:catalog, :user => @current_user)
    get :show, :id => catalog.id, :format => 'tex'
    assert_response :success
    assert_template 'show'
  end
  
  test 'should render show' do
    catalog = Factory(:catalog, :user => @current_user)
    get :show, :id => catalog.id
    assert_response :success
    assert_template 'show'
  end
  
  test 'should render new' do
    get :new
    assert_response :success
    assert_template 'new'
  end
  
  test 'should render edit' do
    catalog = Factory(:catalog, :user => @current_user)
    get :edit, :id => catalog.id
    assert_response :success
    assert_template 'edit'
  end
  
  # = Routing Tests ===========================================================
  
  test 'should route to index' do
    assert_routing '/catalogs', path_with_action('index')
    assert_recognizes path_with_action('index'), '/catalogs'
  end
  
  test 'should route to new' do
    assert_routing '/catalogs/new', path_with_action('new')
    assert_recognizes path_with_action('new'), '/catalogs/new'
  end
  
  test 'should route to show' do
    assert_routing '/catalogs/1', path_with_action('show', :id => '1')
    assert_recognizes path_with_action('show', :id => '1'), '/catalogs/1'
  end

  test 'should route to create' do
    assert_routing({ :method => :post, :path => '/catalogs' }, path_with_action('create'))
    assert_recognizes(path_with_action('create'), { :method => :post, :path => '/catalogs' })
  end
  
  test 'should route to edit' do
    assert_routing '/catalogs/1/edit', path_with_action('edit', :id => '1')
    assert_recognizes path_with_action('edit', :id => '1'), 'catalogs/1/edit'
  end

  test 'should route to update' do
    assert_routing({ :method => :put, :path => '/catalogs/1' }, path_with_action('update', :id => '1'))
    assert_recognizes(path_with_action('update', :id => '1'), { :method => :put, :path => '/catalogs/1' })
  end
  
  test 'should route to destroy' do
    assert_routing({ :method => :delete, :path => '/catalogs/1' }, path_with_action('destroy', :id => '1'))
    assert_recognizes(path_with_action('destroy', :id => '1'), { :method => :delete, :path => '/catalogs/1' })
  end
  
end
