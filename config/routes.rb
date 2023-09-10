Rails.application.routes.draw do
  get '/jokes', to: 'jokes#index'
  
  root "pages#index"
end
