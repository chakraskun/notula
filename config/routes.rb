Rails.application.routes.draw do
  root 'notes#index'
  resources :members
  resources :teams
  resources :notes

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
