class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String
  field :done, :type => Boolean, :default => false

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'

  attr_accessible :content, :done, :updater_id

  validates_presence_of :content

end
