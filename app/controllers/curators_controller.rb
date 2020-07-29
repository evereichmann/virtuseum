class CuratorsController < ApplicationController
    
    def new
        @curator = Curator.new
    end

    def create
        create_params = curator_params.merge(user_id: @current_user.id)
        @curator = Curator.create(curator_params)
        redirect_to @current_user
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
