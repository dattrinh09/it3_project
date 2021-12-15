Rails.application.routes.draw do
  resources :discusses
  resources :teachers
  get 'users/show'
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :subject_reviews
  resources :subjects
  root to: "static_pages#home"
  get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
