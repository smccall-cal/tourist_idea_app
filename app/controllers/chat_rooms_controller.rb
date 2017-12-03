class ChatRoomsController < ApplicationController
    def index
        @chat_rooms = ChatRoom.all
    end
    
    def create
        @chat_room = current_user.chat_rooms.build(params[:host_name])
        if @chat_room.save
            flash[:success] = 'Chat added!'
            redirect_to @chat_room
            else
            render 'new'
        end
    end
    
    def show
        @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
        @message = Message.new
    end
    
    private
    
end