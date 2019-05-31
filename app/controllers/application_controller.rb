class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_user

  ## to apply methods to all views
  helper_method :current_user, :logged_in?

  def current_user
    ## with || if already have @current_user will doesnt hit the DB again
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    ## Switching True//false If current_user
    !!current_user
  end

  def require_user
    ## if not logged_in
    if !logged_in?
      flash[:notice] = " You must be logged in to perfor that action"
      redirect_to login_path
    end
  end

end
