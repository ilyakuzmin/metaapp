module ApplicationHelper
  def beauty_datetime(time)
    time.strftime("%k:%M %e %B %Y")
  end
end
