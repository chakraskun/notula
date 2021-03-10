
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'teams#welcome'

  resources :sessions
  resources :attendances
  resources :minutelists
  resources :create_minutelists
  resources :members
  resources :teams
  resources :notes

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#new'

  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'

  resources :sessions, only: [:create]

  namespace :api, defaults: {format: :hash} do
    namespace :v1 do
      get 'tokens/create'
      resources :tokens, only: [:create]
      resources :teams
      resources :members
      resources :notes, only: %i[show index create update]
    end
  end
end
