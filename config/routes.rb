Endpoint::Application.routes.draw do
  root :controller => 'dashboard', :action => 'index'
  get '/:id' => 'tapsters#show', :id => /[0-9a-f]{40}/, :as => 'tapster'
  post '/tapsters' => 'tapsters#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/me' => 'users#show', :as => 'user'
  get '/tapsters' => 'tapsters#index', :as => 'tapsters'
  put '/friendships/:id' => 'friendships#update', :as => 'friendship'
  post '/tapsters/:tapster_identifier/options/:option_id/votes' => 'votes#create', :as => 'votes'
end
