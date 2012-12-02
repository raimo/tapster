class Option < ActiveRecord::Base
  attr_accessible :tapster_id, :text
  belongs_to :tapster
  has_many :votes

  def owned_by?(user)
    self.tapster.user.id == user.id
  end
end
