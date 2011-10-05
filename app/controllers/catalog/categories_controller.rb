class Catalog::CategoriesController < ApplicationController
  before_filter :set_catalog

  def index
    @category = @catalog.categories.page(params[:page])
  end

  def show
     @category = @catalog.categories.find(params[:id])
  end

  def new
    @category = @catalog.categories.build
  end

  def edit
    @category = @catalog.categories.find(params[:id])
  end

  def create
    @category = @catalog.categories.build(params[:category])

    if @category.save
      flash[:notice] = "Category created."
      redirect_to catalog_categories_path(@catalog, @category)
    else
      render :action => :new
    end
  end

  def update
    @category = @catalog.categories.find(params[:id])

    if @category.update_attributes(params[:category])
      flash[:notice] = "Category updated."        
      redirect_to catalog_categories_path(@catalog, @category)
    else
      render :action => :edit
    end
  end

  def destroy
    @category = @catalog.categories.find(params[:id]).destroy
    redirect_to :action => :index
  end

  protected
  
  def set_catalog
    @catalog = current_user.catalogs.find(params[:catalog_id])
  end
  
end