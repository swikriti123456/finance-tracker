class FreindshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.freindships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "following friend"
    else
      flash[:alert] = "there was something wrong with the tracking request"
     end
     redirect_to my_friends_path 
  end

  def destroy
    friendship = current_user.freindships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
