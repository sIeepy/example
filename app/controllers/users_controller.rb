class UsersController < ApplicationController
  expose(:users) { User.all_except(current_user).search(params[:search]) }
  expose(:user) { User.find(params[:id]) }
  expose(:microposts) { user.microposts }

  def index; end

  def following
    @title = "Following"
    @users = user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = user.followers
    render 'show_follow'
  end
end
