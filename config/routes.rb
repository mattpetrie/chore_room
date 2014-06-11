Rails.application.routes.draw do
  root to: 'chore_assignments#index'
  
  resource :session, only: :new
  
  resources :chores

  get "/users/leaderboard", to: "users#leaderboard", as: "leaderboard"
  resources :users, only: [:show, :index]

  get "/auth/github/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: "signout"
  
  post "/chore_assignments/send_chores", to: "chore_assignments#send_chores", as: "send_chores"
  get "/chore_assignments/complete/:id", to: "chore_assignments#complete", as: "complete_chore"
  get "/chore_assignments/flag/:id", to: "chore_assignments#flag", as: "flag_chore"
  get "/chore_assignments/unflag/:id", to: "chore_assignments#unflag", as: "unflag_chore"
  get "/static_pages/thank_you", to: "static_pages#thank_you", as: "thank_you"
  get "/static_pages/too_early", to: "static_pages#too_early", as: "too_early"
end
