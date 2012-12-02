class Tapster < ActiveRecord::Base
  attr_accessible :identifier, :question, :user_id
  belongs_to :user
  has_many :options, :order => :position
  validates_presence_of :question
end
