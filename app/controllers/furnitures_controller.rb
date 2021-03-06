class FurnituresController < ApplicationController

    def index
        @furnitures = Furniture.all
    end

    def show
        @furniture = Furniture.find(params[:id])
    end

    def new
        @furniture = Furniture.new
    end

    def edit
        @furniture = Furniture.find(params[:id])
        
    end

    def create
        @furniture = Furniture.new(furniture_params)
        
        if @furniture.save
        redirect_to @furniture
        else
            render 'new'
        end
    end

    def update

        @furniture = Furniture.find(params[:id])
       
        if @furniture.update(furniture_params)
          redirect_to @furniture
          # raise params.inspect
        else
          render 'edit'
        end
    end

    def destroy
        @furniture = Furniture.find(params[:id])
        @furniture.destroy
        
        redirect_to furnitures_path
    end
    private
        def furniture_params
            params.require(:furniture).permit(:name, :description, :style, :features, :materials, :care, :sku, :weight, :category, :hasOak,
            :hasCedar, :hasBirch, :hasPine, :hasSuffering, :hasUnicorns)
    end

end
