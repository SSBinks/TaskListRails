class SessionsController < ApplicationController

  def login_failure; end

  def login; end

  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to login_failure_path unless auth_hash['uid']
    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if @user.nil?
      # User doesn't match anything in the DB.
      # Attempt to create a new user.
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save
    end

    redirect_to tasks_path
  end

  def logout
      session.delete(:uid)
      redirect_to tasks_path
  end

end