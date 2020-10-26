class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index

    end

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new(sender_id: current_user.id)
    end
end
