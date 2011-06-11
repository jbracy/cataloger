class UserSessionsController < ApplicationController
  
  skip_before_filter :require_user
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:notice] = "Login successful."
      redirect_to account_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
  
end
