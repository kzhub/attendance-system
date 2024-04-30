Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#index'

  resources :users
end
