Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get "/account", to: "devise/sessions#new", as: :new_user_session
    post "/account", to: "devise/sessions#create", as: :user_session
    delete "/account", to: "devise/sessions#destroy", as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"
  get "/pricing", to: "pages#pricing", as: "pricing"
  get "/faq", to: "pages#faq", as: "faq"

  get "/tutors", to: "tutors#index", as: "tutors"
  get "/tutors/connex", to: "tutors#connex", as: "connex_search"
  get "/tutors/:id", to: "tutors#show", as: "tutor"
  get "/tutors/tutor_id/sessions/new", to: "sessions#new", as: "new_session"
  post "/tutors/tutor_id/sessions", to: "sessions#create", as: "create_session"
  get "/tutors/tutor_id/sessions/confirm", to: "sessions#confirm", as: "confirm_session"

  get "/sessions/success", to: "sessions#success", as: "success_sessions"
  post "/sessions/webhook", to: "sessions#webhook", as: "session"
  get "/sessions/:id", to: "sessions#show", as: "show_sessions"

  get "/tutor_account/new", to: "accounts#newtutor", as: "new_tutor_account"
  post "/tutor_account", to: "accounts#createtutor", as: "create_tutor_account"
  get "/user_account", to: "accounts#show", as: "show_account"
  get "/account/:id/edit", to: "accounts#edit", as: "edit_account"
  patch "/account/:id", to: "accounts#update", as: "update_account"
  delete "/account/:id", to: "accounts#destroy", as: "delete_account"

end
