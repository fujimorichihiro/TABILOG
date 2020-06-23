class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    render 'users/follow'
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow(@user)
    render 'users/unfollow'
  end
end
