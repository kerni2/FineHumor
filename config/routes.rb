# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :jokes

  namespace :api do
    resources :tags, only: :index
  end

  namespace :admin do
    resources :users, only: %i[index create]
  end

  root 'pages#index'
end
