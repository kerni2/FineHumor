Rails.application.routes.draw do
  devise_for :users
  resources :jokes
  
  root "pages#index"
end
