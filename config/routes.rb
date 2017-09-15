Rails.application.routes.draw do
  resources :lists
  
  root 'lists#welcome'

  get '/index' =>  'lists#index'
  get '/welcome' => 'lists#welcome'
  get '/training' => 'lists#training'
  get '/licensing' => 'lists#licensing'

end
