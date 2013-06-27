StackOverflow::Application.routes.draw do
  resources :questions
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new'
  match '/login',   to: 'sessions#new'
  match '/logout',  to: 'sessions#destroy', via: :delete

  root :to => 'questions#index'
end
