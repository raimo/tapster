Endpoint::Application.routes.draw do
  match '/request/:id' => 'requests#show', :as => 'request'
  match '/requests' => 'requests#index'
  match '/*path' => 'mocks#action'
  match '/' => 'mocks#action'
end
