# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'timeout'

class Node
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'

  attr_accessible :content, :creater_id, :updater_id

  scope :latest, ->(user) { where(creater_id: user.id).desc(:created_at) }
  scope :latest_all, desc(:created_at)

  validates_presence_of :content, message: '写点东西吧'

  def type
    self._type && self._type.downcase
  end

  class << self
    def build_node(node)
      node_i = nil
      node[:content].strip!
      begin
        url = URI.parse node[:content]
        if url.host && url.scheme =~ /^https?$/
          timeout(20) do
            url_source = open(url)
            content_type = url_source.content_type
            puts '>>>>>>'+content_type
            if content_type =~ /^image/ #photo
              node_i = Picture.new(node)
            elsif content_type == 'application/x-shockwave-flash' # video
              node[:url] = url.to_s
              node_i = Video.new(node)
            elsif content_type == 'text/plain' # link&file
              node[:title] = url.path.scan(/[^\/]+\/*$/).first
              node_i = Link.new(node)
            elsif content_type == 'text/html' # link
              doc = Nokogiri::HTML(url_source)
              node[:title] = doc.css('title').first.content
              node_i = Link.new(node)
            end
          end
        end
      rescue OpenURI::HTTPError
        error = '无法打开页面'
      rescue Timeout::Error
        error = '获取链接信息超时'
      rescue BSON::InvalidStringEncoding
        error = '无法解析页面'
      rescue Exception
        error = '无法解析页面'
      ensure
        node_i = Node.new(node) if node_i.nil?
        node_i.errors.add :content, error unless error.nil?
      end
      node_i
    end
  end
end
