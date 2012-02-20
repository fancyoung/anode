# -*- coding: utf-8 -*-
module PostsHelper
  def timeago(time, options = {})
    content_tag(:abbr, "#{time_ago_in_words(time)}前", {:title => time}) if time
  end
end
