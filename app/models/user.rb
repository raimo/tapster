class User < ActiveRecord::Base
  attr_accessible :email, :facebook_id, :name
  has_many :tapsters
  has_many :friendships
  before_validation :generate_login_token, :on => :create
  private
  def generate_login_token
    self.login_token = Digest::SHA1.hexdigest("#{self.facebook_id}--#{ENV['FACEBOOK_SECRET']}--#{Time.now}")
  end
end
