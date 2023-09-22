Rails.application.routes.draw do
  resources :jokes
  
  root "pages#index"
end
