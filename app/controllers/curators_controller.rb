class CuratorsController < ApplicationController
    
    def new
        @curator = Curator.new
    end

    def create
        @curator = Curator.create(curator_params)
    end

    def edit
        @curator = Curator.find(params[:id])
    end

    def update
        @curator = Curator.find(params[:id])
        @curate.update(curator_params)
        redirect_to curator_path(@curator)
    end

    private

    def curator_params
        params.require(:curator).permit(:user_id, :museum_id)
    end

end
