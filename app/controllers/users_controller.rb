class UsersController < ApplicationController
#index
    def index
        @users = User.all
    end    
#show
    def show 
        @user = User.find(params[:id])
    end    
#new
    def new
        @user = User.new
    end    
#create
    def create 
        @user = User.create(user_params)

        if @user.valid?
            session[:user_id] = @user.id
            
            redirect_to user_path(@user)
        else
            flas[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end    
#edit
    def edit
        @user = User.find(params[:id])
    end    
#update
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end    
#delete
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to :root
    end    
#private params
private
    def user_params
        params.require(:user).permit(:username, :password, :name_first, :name_last, :location, :picture)
    end       
end
