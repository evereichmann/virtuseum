class ItemsController < ApplicationController
    #index
    def index
        @items = Item.all
    end    
#show
    def show
        @item = Item.find(params[:id])
    end    
#new
    def new
        @collection = Collection.all
        @exhibit = Exhibit.all
        @item = Item.new
    end    
#create
    def create
        @item = Item.create(item_params)
        redirect_to item_path(@item)
    end    
#edit
    def edit
        @collection = Collection.all
        @exhibit = Exhibit.all
        @item = Item.find(params[:id])

        if @users == @current_user
            render :edit
        else
            flash[:error] = "Can't Edit Someone Else's Item"
            redirect_to @item
        end
    end    
#update
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to item_path(@item)
    end    
#delete
    def destroy
        @item = Item.find(params[:id])
        if @users == @current_user
            @item.destroy
        else
            flash[:error] = "Can't Edit Someone Else's Item"
            redirect_to item_path(@item)
        end
    end    
#private params
private
    def item_params
        params.require(:item).permit(:name, :year_created, :description, :picture, :classification, :collection_id, :exhibit_id)
    end    
end
