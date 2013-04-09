class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :content, :type => String

  embeds_many :comments

  belongs_to :creater, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'
end
