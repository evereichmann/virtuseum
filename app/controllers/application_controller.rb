class ApplicationController < ActionController::Base

    # self.abstract_class = true

    before_action :authorized

    def set_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorized
        :root unless set_user 
    end

end
