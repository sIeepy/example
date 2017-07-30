class UsersController < ApplicationController
  expose(:microposts) { Micropost.all }

  def show
    @posts = current_user.microposts
  end
end
