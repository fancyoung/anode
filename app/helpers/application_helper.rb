module ApplicationHelper
  def is_active?(page_name)
    "active" if params[:controller] == page_name
  end

  DEFAULT_AVATAR = {
    :large => "/assets/avatar_large.jpg",
    :medium => "/assets/avatar_medium.jpg",
    :small => "/assets/avatar_small.jpg",
  }
  def get_avatar(user, size)
    if user && user.avatar && user.avatar.url
      "#{user.avatar.url}!#{size}"
    else
      DEFAULT_AVATAR[size.to_sym]
    end
  end
end
