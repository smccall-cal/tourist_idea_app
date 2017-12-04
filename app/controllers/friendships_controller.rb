class FriendshipsController < ApplicationController
    def create
        @friendship1 = current_user.friendships.build(:friend_user_id => User.find(params[:chat_room][:friend_id]))
        t = User.find(params[:chat_room][:friend_id])
        @friendship2 = t.friendships.build(:friend_user_id => current_user.id)
        if @friendship1.save && @friendship2.save
            flash[:notice] = "Added friend."
        else
            flash[:notice] = "Unable to add friend."
        end
        @chat_room = current_user.chat_rooms.build(user_id: current_user.id, host_id: t.id)
        @chat_room.save
        params.delete :friend_user_id
        redirect_to chat_room_path(@chat_room.id)
    end
    
    def destroy
        @friendship1 = current_user.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        redirect_to current_user
    end
    
end
