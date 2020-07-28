class ExhibitsController < ApplicationController

    def index  
        @exhibits = Exhibit.all
    end

    def new 
        @exhibit = Exhibit.new
    end

    def create

    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def exhibit_params
        params.require(:exhibit).permit()
    end

end
