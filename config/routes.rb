Rails.application.routes.draw do
  devise_for :users
  default_url_options host: 'localhost:3000'

  resources :rooms do
    resources :messages
  end
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'user/:id', to: 'users#show', as: 'user'
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  
end
