class ApplicationController < ActionController::Base

    before_action :find_user

    def find_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # def authorized
    #     redirect_to new_user_path unless find_user 
    # end

end
