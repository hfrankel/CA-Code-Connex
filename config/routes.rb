Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"
  get "/tutors", to: "tutors#index", as: "tutors"
  get "/tutors/:id", to: "tutors#show", as: "tutor"
  get "/tutors/:id/sessions/new", to: "sessions#new", as: "new_session"
  post "/tutors/:id/sessions", to: "sessions#create", as: "create_session"
  get "/tutors/:id/sessions/show/:id", to: "sessions#show", as: "show_session"

end
