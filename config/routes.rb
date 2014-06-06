Rails.application.routes.draw do  
  root to: 'static_pages#home' 
  resource :session, only: :new
  
  get "/auth/github/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
end
