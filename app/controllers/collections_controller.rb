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
        @collection = Collection.create(collection_params)
        if @collection.save
            redirect_to collection_path(@collection)
        else   
        redirect_to new_collection_path
        end    
    end    
#edit
    def edit
        @user = User.all
        @collection = Collection.find(params[:id])
        if @users == @current_user
            render :edit
        else
            flash[:error] = "Can't Edit Someone Else's Collection"
            redirect_to @collection
        end
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
        if @users == @current_user
            @collection.destroy
        else
            flash[:error] = "Can't Edit Someone Else's Collection"
            redirect_to collection_path(@collection)
        end
    end    
#private params
private
    def collection_params
        params.require(:collection).permit(:name, :user_id, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy))
    end    
end
