class Request < ActiveRecord::Base
  attr_accessible :body, :fullpath, :method
end
