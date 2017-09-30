Rails.application.routes.draw do
  devise_for :users
  resources :lists

  authenticated :user do
  	root 'lists#account', as: "authenticated_root"
  end
  
  root 'lists#welcome'

  get '/index' =>  'lists#index'
  get '/welcome' => 'lists#welcome'
  get '/training' => 'lists#training'
  get '/licensing' => 'lists#licensing'

end
