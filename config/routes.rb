Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      get 'tokens/create'
    end
  end
  root 'pages#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tokens, only: [:create]
      resources :teams
      resources :members
      resources :notes, only: %i[show index create update]
    end
  end
end
