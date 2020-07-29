class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :login, :root]

    def root 
        redirect_to 'pages#home'
    end    

    def new 
        render :login
    end

    def login
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Username or Password is incorrect"
            redirect_to new_session_path
        end

    end


    def logout
        session.delete(:user_id)
        redirect_to 'pages#home'
    end
end