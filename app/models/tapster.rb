class Tapster < ActiveRecord::Base
  attr_accessible :identifier, :question, :user_id
  belongs_to :user
  has_many :options, :order => :position
end
