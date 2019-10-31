Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"
  get "/tutors", to: "tutors#index", as: "tutors"
  get "/tutors/:id", to: "tutors#show", as: "tutor"

end
