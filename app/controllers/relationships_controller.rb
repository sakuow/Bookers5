class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    follow = current_user.follow(@user)
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
