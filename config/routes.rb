Endpoint::Application.routes.draw do
  root :controller => 'dashboard', :action => 'index'
  get '/:id' => 'tapsters#show', :id => /[0-9a-f]{40}/, :as => 'tapster'
  post '/tapsters' => 'tapsters#create'
  get '/auth/facebook/callback' => 'sessions#create'
end
