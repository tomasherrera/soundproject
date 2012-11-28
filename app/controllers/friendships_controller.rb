class FriendshipsController < ApplicationController
def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Followed."
    
    respond_to do |format|
      format.html { redirect_to root_url }# index.html.erb
      format.js {render :replace}
      end
  else
    flash[:error] = "Unable to follow."
    respond_to do |format|
      # index.html.erb
      format.js {render :replace}
      end
  end
end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Unfollowed"
  redirect_to root_url
end
end