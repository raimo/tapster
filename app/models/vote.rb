class Vote < ActiveRecord::Base
  attr_accessible :option_id, :user_id
  belongs_to :user
  belongs_to :option
end
