class CatalogsController < ApplicationController
  
  def index
    @catalogs = current_user.catalogs
  end
  
  def show
    @catalog = current_user.catalogs.find(params[:id])
  end
  
  def edit
    @catalog = current_user.catalogs.find(params[:id])
  end
  
  def new
    @catalog = Catalog.new
  end
  
  def create
    @catalog = current_user.catalogs.build(params[:catalog])
    
    if @catalog.save
      flash[:notice] = "Catalog created."
      redirect_to catalog_path(@catalog)
    else
      render :action => :new
    end
  end

  def update
    @catalog = current_user.catalogs.find(params[:id])
    
    if @catalog.update_attributes(params[:catalog])
      flash[:notice] = "Catalog updated."
      redirect_to catalog_path(@catalog)
    else
      render :action => :edit
    end
  end
  
  def destroy
    current_user.catalogs.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
end