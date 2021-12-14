Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :subject_reviews
  resources :subjects
  root to: "static_pages#home"
  get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
