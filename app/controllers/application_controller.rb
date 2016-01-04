class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_parent
  	@current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
  end

  helper_method :current_parent

  def current_child
  	@current_child = Child.find_by_id(params[:id])
  end

  helper_method :current_child
end
