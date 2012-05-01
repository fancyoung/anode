# -*- coding: utf-8 -*-
class Video < Node
  field :title
  field :thumb
  field :url
  attr_accessible :title, :thumb, :url
end
