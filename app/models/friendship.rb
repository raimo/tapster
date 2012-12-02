class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :tags, :user_id
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
