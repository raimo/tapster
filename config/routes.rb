Endpoint::Application.routes.draw do
  match '/requests' => 'requests#index'
  match '/*path' => 'mocks#action'
  match '/' => 'mocks#action'
end
