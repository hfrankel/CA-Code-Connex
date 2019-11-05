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
  # get "/tutors/:id/sessions/show/:id", to: "sessions#show", as: "show_session"


  
  get "/user_account", to: "accounts#show", as: "show_account"
  get "/account/:id/edit", to: "accounts#edit", as: "edit_account"
  patch "/account/:id", to: "account#update", as: "update_account"
  delete "/account/:id", to: "account#destroy", as: "delete_account"

end
