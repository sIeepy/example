class UsersController < ApplicationController
  expose(:users) { User.search(params[:search]) }

  def index; end
end
