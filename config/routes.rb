Rails.application.routes.draw do
  root to: 'chores#index'
  resource :session, only: :new
  resources :chores

  get "/auth/github/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  post "/chores/send_chores", to: "chores#send_chores", as: "send_chores"
  get "/chores/complete/:id", to: "chores#complete"
  get "/static_pages/thank_you", to: "static_pages#thank_you", as: "thank_you"
end
