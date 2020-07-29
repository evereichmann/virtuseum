class MuseumsController < ApplicationController

    def index  
        @museums = Museum.all
    end

    def new 
        @museum = Museum.new
    end

    def create
        @museum = Museum.create(museum_params)
        redirect_to museum_path(@museum)
    end

    def show
        @museum = Museum.find(params[:id])
    end

    def edit
        @museum = Museum.find(params[:id])
        if @users == @current_user
            render :edit
        else
            flash[:error] = "Can't Edit Someone Else's Collection"
            redirect_to @museum
        end
    end

    def update
        @museum = Museum.find(params[:id])
        @museum.update(museum_params)
        redirect_to museum_path(@museum)
    end

    private
    
    def museum_params
        params.require(:museum).permit(:name, :field_of_study, :information)
    end

end
