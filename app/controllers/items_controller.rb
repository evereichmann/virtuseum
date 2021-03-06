class ItemsController < ApplicationController

    #index
    def index
        @items = Item.all
    end    
#show
    def show
        @collection = Collection.all
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
    end    
#update
    def update
        @item = Item.find(params[:id])
        if @current_user.id == @item.collection.user.id
            @item.update(item_params)
            redirect_to item_path(@item)
        else   
            flash[:error] = "This is Not Your Item"
            redirect_to item_path(@item)
        end    
    end    
#delete
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_path
    end    
#private params
private
    def item_params
        params.require(:item).permit(:name, :year_created, :description, :picture, :classification, :collection_id, :exhibit_id)
    end    
end
