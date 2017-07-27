class MicropostDecorator < Draper::Decorator
  delegate_all

  def creation_date
    object.created_at.strftime("%d-%m-%y %H:%M")
  end

end
