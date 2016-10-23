class SessionsController < ApplicationController

    def login_failure; end

    def login; end

    def create
        auth_hash = request.env['omniauth.auth']
        redirect_to login_failure_path unless auth_hash['uid']
        @task = Task.find_by(uid: auth_hash[:uid], provider: 'github')
        if @task.nil?
          @task = Task.build_from_github(auth_hash)
          render :login_failure unless @task.save
        end

        session[:merchant_id] = @task.id
        redirect_to sessions_path
    end

    def index
        if session[:merchant_id].nil?
            redirect_to login_failure_path
        else
            @task = Merchant.find(session[:merchant_id]) # < recalls the value set in a previous request
        end
    end

    def destroy
        session.delete(:merchant_id)
        redirect_to login_failure_path
    end

end
