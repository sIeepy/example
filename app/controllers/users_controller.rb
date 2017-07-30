class UsersController < ApplicationController
  expose(:microposts) { Micropost.all }
  expose(:micropost, attributes: :micropost_params)
  
  def show
    @posts = current_user.microposts
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :created_at)
  end
end
