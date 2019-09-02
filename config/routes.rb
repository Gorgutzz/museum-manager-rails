Rails.application.routes.draw do

  resources :museums
  resources :users
  resources :exhibits

  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get "/auth/github/callback" => "sessions#create"


  get 'most_exhibits' => 'museums#most_exhibits'

  resources :exhibits, only: [:index, :new, :show, :create]

  resources :users , only: [:new, :show] do
    resources :exhibits , only: [:show, :index]
  end

  resources :museums , only: [:new, :show] do
    resources :exhibits , only: [:show, :index, :edit]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
