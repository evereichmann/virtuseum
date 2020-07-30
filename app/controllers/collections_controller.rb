class CollectionsController < ApplicationController
    
    #index
    def index
        @collections = Collection.all
    end    
#show
    def show
        @collection = Collection.find(params[:id])
    end    
#new
    def new
        @user = User.all
        @item = Item.new
        @collection = Collection.new
    end    
#create
    def create
        @collection = Collection.create(user_id: @current_user.id, name: params[:collection][:name])
        redirect_to collection_path(@collection)
    end    
#edit
    def edit
        @user = User.all
        @collection = Collection.find(params[:id])
    end    
#update
    def update
        @collection = Collection.find(params[:id])
        @collection.update(collection_params)
        redirect_to collection_path(@collection)
    end    
#delete
    def destroy
        @collection = Collection.find(params[:id])
        @collection.destroy
        redirect_to collection_path(@collection)
    end    
#private params
private
    def collection_params
        params.require(:collection).permit(:name, :user_id, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy))
    end    
end
