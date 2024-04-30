Rails.application.routes.draw do
  #namespace切ってまとめられるかも
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'pages#index'

  resources :users do
    resources :attendances
  end
end
