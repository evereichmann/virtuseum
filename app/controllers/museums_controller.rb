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
    end

    def update
        @museum = Museum.find(params[:id])
        if [@current_user.id] == @museum.users.ids
            @museum.update(museum_params)
            redirect_to museum_path(@museum)
        else 
            flash[:error] = "You This Museum's Curator"
            redirect_to museum_path(@museum)
        end    
    end

    private
    
    def museum_params
        params.require(:museum).permit(:name, :field_of_study, :information)
    end

end
