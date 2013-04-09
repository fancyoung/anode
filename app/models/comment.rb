# -*- coding: utf-8 -*-
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String

  embedded_in :post, :inverse_of => :comments
  belongs_to :creater, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'

  validates_presence_of :content, message: "回复不能为空"
  validates_length_of :content,
    minimum: 1,
    too_short: "写几个字吧"
end
