Rails.application.routes.draw do
  root to: "lectures#index"
  resources :lectures, only: [:index, :show, :search]
  resources :reviews, only: [:new, :create]
end
