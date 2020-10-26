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
        @property = Property.new(property_params)
        @property.landlord_id = current_user.id
        @property.save!
        redirect_to property_path(@property)
    end


    def edit
        
    end

    def update

    end


    def destroy
        @property = Property.find(params[:id]).destroy
        redirect_to "/users/my_properties"
    end

    private

    def property_params
        params.require(:property).permit(:landlord_id, :address, :rooms, :bathrooms, :squarefeet, :storeys, :rent, :description, :available)
    end
end
