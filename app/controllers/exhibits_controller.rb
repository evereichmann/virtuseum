class ExhibitsController < ApplicationController

    def index  
        @exhibits = Exhibit.all
    end

    def new 
        @exhibit = Exhibit.new
    end

    def create
        @exhibit = Exhibit.create(exhibit_params)
        redirect_to exhibit_path(@exhibit)
    end

    def show
        @exhibit = Exhibit.find(params[:id])
    end

    def edit
        @exhibit = Exhibit.find(params[:id])
    end

    def update
        @exhibit = Exhibit.find(params[:id])
        @exhibit.update(exhibit_params)
        redirect_to exhibit_path(@exhibit)
    end

    private

    def exhibit_params
        params.require(:exhibit).permit(:name, :picture, :category, :date, :museum_id)
    end

end
