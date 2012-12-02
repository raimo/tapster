class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :tags, :user_id
end
