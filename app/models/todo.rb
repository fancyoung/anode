class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String
  field :done, :type => Boolean

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'

  validates_presence_of :content

end
