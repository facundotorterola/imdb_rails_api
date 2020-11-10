# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user, only: %i[index show create update]
  resources :movie, only: %i[index show create update] do
    resources :review, only: %i[create update]
  end

  post '/auth/login', to: 'authentication#login'
end
