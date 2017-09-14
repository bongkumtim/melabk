Rails.application.routes.draw do
  resources :lists
  
  root 'lists#welcome'

  get '/index' =>  'lists#index'
  get '/welcome' => 'lists#welcome'

end
