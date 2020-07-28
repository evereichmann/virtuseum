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
        @collection = Collection.new
    end    
#create
    def create
        @collection = Collection.create(collection_params)
        redirect_to collection_path(@collection)
    end    
#edit
    def edit
        @collection = Collection.find(params[:id])
    end    
#update
    def update
        @collection = Collection.find(params[:id])
        @collection.update(collection_params)
        redirect_to collection_params(@collection)
    end    
#delete
    def destory
        @collection = Collection.find(params[:id])
        @collection.destory
        redirect_to collections_path
    end    
#private params
private
    def collection_params
        params.require(:collection).permit(:name, :user_id)
    end    
end
