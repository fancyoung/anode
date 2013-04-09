class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String
  field :done, :type => Boolean, :default => false

  belongs_to :creater, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'

  attr_accessible :content, :done, :updater_id

  validates_presence_of :content

end
