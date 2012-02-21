class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :content, :type => String

  embeds_many :comments

  referenced_in :creater, :class_name => 'User'
  referenced_in :updater, :class_name => 'User'
end
