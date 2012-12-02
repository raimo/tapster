Endpoint::Application.routes.draw do
  root :controller => 'dashboard', :action => 'index'

  get '/:id' => 'tapsters#show', :id => /[0-9a-f]{40}/
  post '/tapsters' => 'tapsters#create'
  get '/tapsters' => 'tapsters#create'
  get '/sign_in' => 'sessions#create'
end
