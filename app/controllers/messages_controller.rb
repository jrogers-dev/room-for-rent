class MessagesController < ApplicationController
    before_action :authenticate_user!
    #before_action :message_params, only: :create

    def index

    end

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.create!(message_params)
        redirect_to "/users/#{current_user.id}/messages/#{@message.id}"
    end

    private

    def message_params
        params.require(:message).permit(:sender_id, :recipient_id, :message_content)
    end
end
