class MicropostsController < ApplicationController
  expose(:microposts) { Micropost.all }
  expose(:micropost, attributes: :micropost_params)

  def create
    micropost = current_user.microposts.build(micropost_params)
    if micropost.save
      redirect_to microposts_path, notice: I18n.t('shared.created', resource: 'Micropost')
    else
      redirect_to microposts_path
    end
  end

  def destroy
    micropost.destroy
    redirect_to microposts_path, notice: I18n.t('shared.deleted', resource: 'Micropost')
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :created_at)
  end
end
