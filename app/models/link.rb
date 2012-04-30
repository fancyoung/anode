# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'timeout'

class Link < Node
  field :title
  attr_accessible :title

  before_create :fetch_info

  def fetch_info
    begin
      timeout(20) do
        doc = Nokogiri::HTML(open(self.content))
        self.title = doc.css('title').first.content
      end
    rescue OpenURI::HTTPError
      self.errors.add :title, '无法打开页面'
    rescue Timeout::Error
      self.errors.add :title, '获取链接信息超时'
    rescue Exception
      self.errors.add :title, '无法解析页面'
    end
  end
end
