class PropertiesController < ApplicationController
    
    def index

    end

    def show
        @property = Property.find(params[:id])
    end


    def new
        @property = Property.new
    end

    def create
        params.require(:property).permit!
        @property = Property.new(params[:property])
        @property.landlord_id = current_user.id
        @property.save!
        redirect_to property_path(@property)
    end


    def edit
        
    end

    def update

    end


    def destroy

    end
end
