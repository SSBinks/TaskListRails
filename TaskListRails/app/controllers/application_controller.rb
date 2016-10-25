class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  private
  def user
      @user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if user.nil?
      flash[:error] = "You must be logged in to perform this action"
      redirect_to tasks_path
    end
  end
end
