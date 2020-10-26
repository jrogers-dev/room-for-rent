class PropertiesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_property, only: [:show, :edit, :update, :destroy]
    
    def index

    end

    def show

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
        @property.update(property_params)
        redirect_to property_path(@property)
    end


    def destroy
        @property.destroy
        redirect_to "/users/my_properties"
    end

    private

    def property_params
        params.require(:property).permit(:landlord_id, :address, :rooms, :bathrooms, :squarefeet, :storeys, :rent, :description, :available)
    end

    def find_property
        @property = Property.find(params[:id])
    end
end
