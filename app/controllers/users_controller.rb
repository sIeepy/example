class UsersController < ApplicationController
  expose(:users) { User.all_except(current_user).search(params[:search]) }
  expose(:user)
  expose(:microposts) {user.microposts}

  def index; end
end
