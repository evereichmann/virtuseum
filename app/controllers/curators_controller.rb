class CuratorsController < ApplicationController
    
    def new
        @curator = Curator.new
    end

    def create
        Curator.create(user_id: @current_user.id, museum_id: params[:curator][:museum_id])
        redirect_to museums_path
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
        params.require(:curator).permit(:museum_id)
    end

end
