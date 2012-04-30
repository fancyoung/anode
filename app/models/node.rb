# -*- coding: utf-8 -*-
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
end
