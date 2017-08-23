class MicropostDecorator < Draper::Decorator
  delegate_all

  def creation_date
    object.created_at.strftime("%d-%m-%y %H:%M")
  end

  def post_age
    # object.created_at > 24.days.ago ? "New" : "Old"
    return "New" if object.created_at > 24.days.ago
    "Old"
  end
end
