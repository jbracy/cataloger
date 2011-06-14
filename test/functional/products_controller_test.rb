require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  def setup
    @current_user = Factory(:user)
    @catalog = Factory(:catalog, :user => @current_user)
    UserSession.create(@current_user)
  end
  
  def teardown
    logout
  end

  test 'index' do
    product = Factory(:product, :catalog => @catalog)
    get :index, :catalog_id => @catalog.id
    assert_response :success
    assert assigns(:catalog)
    assert assigns(:products)
    assert_equal @catalog.products, assigns(:products)
  end

  test 'show' do
    product = Factory(:product, :catalog => @catalog)
    get :show, :catalog_id => @catalog.id, :id => product.id
    assert_response :success
    assert assigns(:catalog)
    assert assigns(:product)
    assert_equal product, assigns(:product)
  end

  test 'new' do
    get :new, :catalog_id => @catalog.id
    assert assigns(:catalog)
    assert assigns(:product)
  end

  test 'edit' do
    product = Factory(:product, :catalog => @catalog)
    get :edit, :catalog_id => @catalog.id, :id => product
    assert assigns(:catalog)
    assert assigns(:product)
  end

  test 'create' do
    post :create, :catalog_id => @catalog.id, :product => Factory.attributes_for(:product)
    assert assigns(:catalog)
    assert assigns(:product)
    assert_equal @catalog, assigns(:product).catalog
    assert_response :redirect
    assert_redirected_to catalog_product_path(@catalog, assigns(:product))
  end

  test 'update' do
    product = Factory(:product, :catalog => @catalog)
    put :update, :catalog_id => @catalog.id, :id => product.id, :product => { :name => "Test Name" }
    assert assigns(:catalog)
    assert assigns(:product)
    assert_equal "Test Name", assigns(:product).name
    assert_equal "Test Name", Product.find(product.id).name
    assert_response :redirect
    assert_redirected_to catalog_product_path(@catalog, product)
  end

  # = Render Tests ============================================================

  test 'should render index' do
    get :index, :catalog_id => @catalog.id
    assert_response :success
    assert_template 'index'
  end

  test 'should render show' do
    product = Factory(:product, :catalog => @catalog)
    get :show, :catalog_id => @catalog.id, :id => product.id
    assert_response :success
    assert_template 'show'
  end

  test 'should render new' do
    get :new, :catalog_id => @catalog.id
    assert_response :success
    assert_template 'new'
  end

  test 'should render edit' do
    product = Factory(:product, :catalog => @catalog)
    get :edit, :catalog_id => @catalog.id, :id => product.id
    assert_response :success
    assert_template 'edit'
  end

  # = Routing Tests ===========================================================

  test 'should route to index' do
    assert_routing '/catalogs/1/products', path_with_action('index', :catalog_id => '1')
    assert_recognizes path_with_action('index', :catalog_id => '1'), '/catalogs/1/products'
  end

  test 'should route to new' do
    assert_routing '/catalogs/1/products/new', path_with_action('new', :catalog_id => '1')
    assert_recognizes path_with_action('new', :catalog_id => '1'), '/catalogs/1/products/new'
  end

  test 'should route to show' do
    assert_routing '/catalogs/1/products/1', path_with_action('show', :catalog_id => '1', :id => '1')
    assert_recognizes path_with_action('show', :catalog_id => '1', :id => '1'), '/catalogs/1/products/1'
  end

  test 'should route to create' do
    assert_routing({ :method => :post, :path => '/catalogs/1/products' }, path_with_action('create', :catalog_id => '1'))
    assert_recognizes(path_with_action('create', :catalog_id => '1'), { :method => :post, :path => '/catalogs/1/products' })
  end

  test 'should route to edit' do
    assert_routing '/catalogs/1/products/1/edit', path_with_action('edit', :catalog_id => '1', :id => '1')
    assert_recognizes path_with_action('edit', :catalog_id => '1', :id => '1'), 'catalogs/1/products/1/edit'
  end

  test 'should route to update' do
    assert_routing({ :method => :put, :path => '/catalogs/1/products/1' }, path_with_action('update', :catalog_id => '1', :id => '1'))
    assert_recognizes(path_with_action('update', :catalog_id => '1', :id => '1'), { :method => :put, :path => '/catalogs/1/products/1' })
  end

  test 'should route to destroy' do
    assert_routing({ :method => :delete, :path => '/catalogs/1/products/1' }, path_with_action('destroy', :catalog_id => '1', :id => '1'))
    assert_recognizes(path_with_action('destroy', :catalog_id => '1', :id => '1'), { :method => :delete, :path => '/catalogs/1/products/1' })
  end

end
