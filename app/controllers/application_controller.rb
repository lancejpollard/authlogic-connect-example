class ApplicationController < ActionController::Base
  #protect_from_forgery
  layout 'application'
  helper :all
  helper_method :current_user_session, :current_user
  
  def login_required
    if current_user.nil?
      redirect_to new_user_url
      true
    end
    false
  end
  
  private
    def admin_only
      if Rails.env == "production"
        authenticate_or_request_with_http_basic do |id, password|
          id == ENV["USER"] && password == ENV["PASSWORD"]
        end
      end
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to profile_url(current_user)
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
