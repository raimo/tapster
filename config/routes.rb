Endpoint::Application.routes.draw do
  match '/:id' => 'tapsters#show', :id => /[0-9a-f]{40}/
  match '/request/:id' => 'requests#show', :as => 'request'
  match '/requests' => 'requests#index'
  match '/' => 'dashboard#index'
end
