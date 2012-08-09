Endpoint::Application.routes.draw do
  match '/*path' => 'mocks#action'
  match '/' => 'mocks#action'
end
