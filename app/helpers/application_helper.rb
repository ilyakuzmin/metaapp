module ApplicationHelper
  def beauty_datetime(time)
    time.strftime("%k:%M %e %B %Y")
  end

  def can_edit_posts?
    user_signed_in?
  end

  def can_edit_post?(post)
    user_signed_in? && post.user == current_user
  end
end
