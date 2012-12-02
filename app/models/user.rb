class User < ActiveRecord::Base
  attr_accessible :email, :facebook_id, :name
  has_many :tapsters
  has_many :friends, :class_name => User, :foreign_key => :friend_id, :through => :friendships
end
