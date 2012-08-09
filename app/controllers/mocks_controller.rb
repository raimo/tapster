class MocksController < ApplicationController
  def action
    Request.create(:body => request.body.read, :fullpath => request.fullpath, :method => request.method)
    request.body.read
  end
end
