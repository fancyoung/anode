class Node
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'

  scope :latest, ->(user) { where(creater_id: user.id).desc(:created_at) }
end
