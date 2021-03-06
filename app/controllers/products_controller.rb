class ProductsController < ApplicationController
  
  before_filter :set_catalog
  
  def index
    @products = @catalog.products.page(params[:page])
  end
  
  def show
    @product = @catalog.products.find(params[:id])
  end
  
  def new
    @product = @catalog.products.build
  end
  
  def create
    @product = @catalog.products.build(params[:product])
    
    if @product.save
      flash[:notice] = "Product created!"
      redirect_to catalog_product_path(@catalog, @product)
    else
      render :action => :new
    end
  end
  
  def edit
    @product = @catalog.products.find(params[:id])
  end
  
  def update
    params[:product][:category_ids] ||= []
    @product = @catalog.products.find(params[:id])
    
    if @product.update_attributes(params[:product])
      flash[:notice] = "Product updated!"
      redirect_to catalog_product_path(@catalog, @product)
    else
      render :action => :edit
    end
  end
  
  def destroy
     @product = @catalog.products.find(params[:id]).destroy
     redirect_to :action => :index
  end
  
  protected
  
  def set_catalog
    @catalog = current_user.catalogs.find(params[:catalog_id])
  end
  
end
