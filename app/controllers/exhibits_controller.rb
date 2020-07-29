class ExhibitsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]

    def index  
        @exhibits = Exhibit.all
    end
    
    def show
        @exhibit = Exhibit.find(params[:id])

    end

    def new 
        @museum = Museum.all
        @exhibit = Exhibit.new
    end

    def create
        @exhibit = Exhibit.create(exhibit_params)
        if @exhibit.save 
        redirect_to exhibit_path(@exhibit)
        else  
            redirect_to new_exhibit_path
        end    
    end


    def edit
        # @museum = Museum.all
        @exhibit = Exhibit.find(params[:id])
        @museum = @exhibit.museum
        @users = @museum.users


        if @users == @current_user
            render :edit
        else
            flash[:error] = "Can't Edit Someone Else's Exhibit"
            redirect_to @exhibit
        end

    end

    def update
        @exhibit = Exhibit.find(params[:id])
        @exhibit.update(exhibit_params)
        redirect_to exhibit_path(@exhibit)
    end

    def destroy
        @exhibit = Exhibit.find(params[:id])
        if @users == @current_user
            @exhibit.destroy(exhibit_params)
        else
            flash[:error] = "Can't Edit Someone Else's Exhibit"
            redirect_to exhibit_path(@exhibit)
        end
    end    

    private

    def exhibit_params
        params.require(:exhibit).permit(:name, :picture, :category, :date, :museum_id, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy))
    end

end
