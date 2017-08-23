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
    # if current_user.id == micropost.user_id
      micropost.destroy
      redirect_to microposts_path, notice: I18n.t('shared.deleted', resource: 'Micropost')
    # else
    #   redirect_to microposts_path
    #   flash[:error] = "not good"
    # end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :created_at)
  end
end
