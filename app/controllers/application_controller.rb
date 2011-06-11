class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  
  before_filter :require_user
  
  private
  
  def current_user_session
    @current_user_session ||= UserSession.find
  end
  
  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end
  
  def require_user
    return if current_user
    
    respond_to do |format|
      format.html { redirect_to login_path }
      format.all  { render :text => 'Unauthorized', :status => :unauthorized }
    end
  end
  
  def require_no_user
    redirect_to account_path if current_user
  end
  
end
