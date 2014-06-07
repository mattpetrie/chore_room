Rails.application.routes.draw do
  root to: 'chores#index'
  resource :session, only: :new

  get "/auth/github/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  post "/chores/send_chores", to: "chores#send_chores", as: "send_chores"
end
