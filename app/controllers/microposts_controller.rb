class MicropostsController < ApplicationController
  expose(:microposts) { Micropost.all }
  expose(:micropost)
  
  def show; end
end
