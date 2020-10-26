class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index

    end

    def show
        @message = Message.find(params[:id])
        @property = Property.find(@message.property_id)
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.create!(message_params)
        redirect_to property_path(@message.property_id)
    end

    private

    def message_params
        params.require(:message).permit(:sender_id, :recipient_id, :message_content, :application, :property_id)
    end
end
