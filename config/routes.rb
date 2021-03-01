Rails.application.routes.draw do

  resources :minutelists
  resources :create_minutelists
  resources :members
  resources :teams, only: [:new, :create]
  resources :notes

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/logout', to: 'sessions#destroy'

  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  
  # namespace :api do
  #   namespace :v1 do
  #     get 'tokens/create'
  #   end
  # end

  # resources :sessions, only: [:create]
  # root 'pages#index'

  # namespace :api, defaults: {format: :json} do
  #   namespace :v1 do
  #     resources :tokens, only: [:create]
  #     resources :teams
  #     resources :members
  #     resources :notes, only: %i[show index create update]
  #   end
  # end
end
